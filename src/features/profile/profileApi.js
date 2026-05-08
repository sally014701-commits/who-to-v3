// Api (Data) 레이어: Firebase 통신만 담당합니다.

export async function saveStudentProfile(code, student) {
    const W = window.WHO2MEET;
    return await W.firebase.saveStudentInDB(code, student);
}

export async function assignLateJoiner(code, session, student) {
    const W = window.WHO2MEET;
    return await W.firebase.assignLateJoinerToTeam(code, session, student);
}

export async function fetchLatestSession(code) {
    const W = window.WHO2MEET;
    return await W.firebase.getSessionByCode(code);
}

export function subscribeToSession(code, callback) {
    const W = window.WHO2MEET;
    return W.firebase.listenToSession(code, callback);
}
