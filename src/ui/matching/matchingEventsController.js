import { createRunMatchingUseCase } from '../../services/matching/runMatchingUseCase.js';
import { createFirebaseSessionRepository } from '../../data/repositories/firebaseSessionRepository.js';
import * as matchingAlgorithm from '../../services/matching/matchingAlgorithm.js';

/**
 * Presentation (UI Controller):
 * - Binds DOM events
 * - Calls UseCases
 * - Performs DOM updates (render/nav)
 */
export function initMatchingEventsController(ctx) {
    var state = ctx.state;
    var firebase = ctx.firebase;
    var render = ctx.render;
    var nav = ctx.nav;

    var sessionRepository = createFirebaseSessionRepository(firebase);
    var usecase = createRunMatchingUseCase({
        sessionRepository: sessionRepository,
        matchingAlgorithm: matchingAlgorithm
    });

    var btnCheckStatus = document.getElementById('btn-check-status');
    if (btnCheckStatus) {
        btnCheckStatus.addEventListener('click', async function () {
            if (!state.currentSession || !state.currentSession.code) return;
            if (!state.currentStudent || !state.currentStudent.id) return;

            try {
                var res = await usecase.checkStatus({
                    sessionCode: state.currentSession.code,
                    studentId: state.currentStudent.id
                });
                state.currentSession = res.session;

                if (res.published) {
                    document.getElementById('results-title').textContent = 'Your Team';
                    render.renderTeams(res.myTeam ? [res.myTeam] : []);
                    nav.showScreen('results');
                }
            } catch (err) {
                console.error(err);
            }
        });
    }

    var btnRefresh = document.getElementById('btn-refresh');
    if (btnRefresh) {
        btnRefresh.addEventListener('click', async function () {
            if (!state.currentSession || !state.currentSession.code) return;
            try {
                state.currentSession = await usecase.refreshSession(state.currentSession.code);
                render.renderDashboard();
            } catch (err) {
                console.error(err);
            }
        });
    }

    var btnRunMatching = document.getElementById('btn-run-matching');
    if (btnRunMatching) {
        btnRunMatching.addEventListener('click', async function () {
            if (!state.currentSession) return;

            var session = state.currentSession;
            try {
                if (session.status === 'published') {
                    var teams = session.teams ? Object.values(session.teams) : [];
                    document.getElementById('results-title').textContent = 'All Teams';
                    var backBtn = document.getElementById('btn-back-dashboard');
                    if (backBtn) backBtn.style.display = 'block';
                    render.renderTeams(teams, true);
                    nav.showScreen('results');
                    return;
                }

                var res = await usecase.runMatchingForInstructor({
                    session: session,
                    studentId: null
                });

                if (!res.teams || res.teams.length === 0) {
                    alert('No students have submitted their profiles yet!');
                    return;
                }

                state.currentSession = res.updatedSession;

                // keep legacy UI behavior: render dashboard + then results
                render.renderDashboard();
                document.getElementById('results-title').textContent = 'All Teams';
                var backBtn = document.getElementById('btn-back-dashboard');
                if (backBtn) backBtn.style.display = 'block';
                render.renderTeams(res.teams, true);
                nav.showScreen('results');
            } catch (err) {
                alert('Error running matching: ' + err.message);
            }
        });
    }

    var btnBackDashboard = document.getElementById('btn-back-dashboard');
    if (btnBackDashboard) {
        btnBackDashboard.addEventListener('click', function () {
            nav.showScreen('instructor-dashboard');
        });
    }
}

