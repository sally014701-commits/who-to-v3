// Api (Data) 레이어: Firebase 통신만 담당합니다.

export async function fetchSessionByCode(code) {
    const W = window.WHO2MEET;
    return await W.firebase.getSessionByCode(code);
}

export function subscribeToSession(code, callback) {
    const W = window.WHO2MEET;
    return W.firebase.listenToSession(code, callback);
}
