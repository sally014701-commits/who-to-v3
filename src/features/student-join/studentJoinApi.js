// Api (Data) 레이어: Firebase 통신만 담당합니다.

export async function fetchSession(code) {
    const W = window.WHO2MEET;
    return await W.firebase.getSessionByCode(code);
}

export async function saveStudent(code, studentData) {
    const W = window.WHO2MEET;
    return await W.firebase.saveStudentInDB(code, studentData);
}

export function subscribeToSession(code, callback) {
    const W = window.WHO2MEET;
    return W.firebase.listenToSession(code, callback);
}
