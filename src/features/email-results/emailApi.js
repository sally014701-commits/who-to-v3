// Api (Data) 레이어: Firebase를 통해 실제로 이메일을 발송하는 역할만 담당합니다.

export async function sendEmailViaFirebase(email, sessionCode) {
    const W = window.WHO2MEET;
    return await W.firebase.sendTeamResultsEmail(email, sessionCode);
}
