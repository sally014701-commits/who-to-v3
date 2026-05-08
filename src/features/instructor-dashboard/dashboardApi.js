// Api (Data) 레이어: 대시보드에서 Firebase 서버와 직접 통신하는 부분만 담당합니다.

export async function fetchLatestSession(code) {
    const W = window.WHO2MEET;
    return await W.firebase.getSessionByCode(code);
}

export async function saveTeamsToDB(code, teamsObj) {
    const W = window.WHO2MEET;
    return await W.firebase.saveTeamsInDB(code, teamsObj);
}
