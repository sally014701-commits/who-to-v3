import { fetchLatestSession, saveTeamsToDB } from './dashboardApi.js';

// Service (비즈니스 로직) 레이어: 매칭 알고리즘을 실행할지 말지 판단하고, 결과를 정리합니다.

export async function refreshDashboard(W) {
    const session = await fetchLatestSession(W.state.currentSession.code);
    W.state.currentSession = session;
    return session;
}

export async function runMatchingProcess(W) {
    const session = W.state.currentSession;
    
    // 1. 이미 매칭이 완료된 경우(published)라면, 기존 결과를 바로 반환합니다.
    if (session.status === 'published') {
        const teams = session.teams ? Object.values(session.teams) : [];
        return { status: 'already_published', teams };
    }

    // 2. 새로 매칭을 돌려야 하는 경우, 가장 최신 방 상태를 서버에서 다시 불러옵니다.
    const latestSession = await fetchLatestSession(session.code);
    W.state.currentSession = latestSession;
    
    // 3. 매칭 알고리즘(두뇌) 실행
    const teams = W.matching.runMatching(latestSession);
    
    // 아무도 프로필을 제출하지 않았을 때 예외 처리
    if (teams.length === 0) {
        throw new Error("NO_STUDENTS");
    }
    
    // 4. 알고리즘 결과를 서버에 저장하기 좋게 포장(객체 형태)합니다.
    const teamsObj = {};
    teams.forEach(team => { teamsObj[team.id] = team; });
    
    // 5. 서버에 저장 및 방 상태를 '매칭 완료(published)'로 갱신
    await saveTeamsToDB(session.code, teamsObj);
    
    W.state.currentSession.teams = teamsObj;
    W.state.currentSession.status = 'published';
    
    return { status: 'newly_published', teams };
}
