/**
 * Domain (UseCase): Instructor matching execution & persistence.
 *
 * Responsibilities:
 * - Decide whether teams are already published.
 * - If not published: fetch latest session, run matching algorithm, persist teams + publish.
 * - Return data needed by UI (teams array, myTeam if studentId provided, updated session).
 *
 * External communication (Firebase) is done via injected repository.
 * No DOM access.
 */

export function createRunMatchingUseCase({ sessionRepository, matchingAlgorithm }) {
    if (!sessionRepository) throw new Error('sessionRepository is required');
    if (!matchingAlgorithm) throw new Error('matchingAlgorithm is required');

    function teamsObjFromTeams(teams) {
        const teamsObj = {};
        teams.forEach((team) => { teamsObj[team.id] = team; });
        return teamsObj;
    }

    function selectMyTeam(teamsArray, studentId) {
        if (!studentId || !teamsArray) return null;
        return teamsArray.find((t) => (t.memberIds || []).includes(studentId)) || null;
    }

    async function refreshSession(sessionCode) {
        const latestSession = await sessionRepository.getSessionByCode(sessionCode);
        return latestSession;
    }

    async function checkStatus({ sessionCode, studentId }) {
        const session = await refreshSession(sessionCode);
        if (session && session.status === 'published') {
            const teamsArray = session.teams ? Object.values(session.teams) : [];
            const myTeam = selectMyTeam(teamsArray, studentId);
            return { session, teams: teamsArray, myTeam, published: true };
        }
        return { session, teams: [], myTeam: null, published: false };
    }

    async function runMatchingForInstructor({ session, studentId }) {
        if (!session || !session.code) throw new Error('session(code) is required');

        // If already published, just return what UI needs.
        if (session.status === 'published') {
            const teamsArray = session.teams ? Object.values(session.teams) : [];
            return {
                updatedSession: session,
                teams: teamsArray,
                myTeam: selectMyTeam(teamsArray, studentId),
                published: true
            };
        }

        // Fetch latest, compute teams, save+publish.
        const latestSession = await refreshSession(session.code);
        const teams = matchingAlgorithm.runMatching(latestSession);

        if (!teams || teams.length === 0) {
            return { updatedSession: latestSession, teams: [], myTeam: null, published: false };
        }

        const teamsObj = teamsObjFromTeams(teams);
        await sessionRepository.saveTeamsInDB(session.code, teamsObj);

        const updatedSession = {
            ...latestSession,
            teams: teamsObj,
            status: 'published'
        };

        return {
            updatedSession,
            teams,
            myTeam: selectMyTeam(teams, studentId),
            published: true
        };
    }

    return {
        refreshSession,
        checkStatus,
        runMatchingForInstructor
    };
}

