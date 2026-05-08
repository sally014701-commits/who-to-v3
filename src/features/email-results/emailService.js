import { sendEmailViaFirebase } from './emailApi.js';

// Service (비즈니스 로직) 레이어: 이메일을 보낼 수 있는 상태인지 검증하고 발송을 지시합니다.

export async function processEmailRequest(W, emailAddress) {
    const session = W.state.currentSession;
    
    // 1. 방 정보가 정상인지 검사
    if (!session || !session.code) {
        throw new Error("NO_SESSION");
    }

    // 2. 이미 매칭된 팀이 존재하는지 검사
    const teams = session.teams ? Object.values(session.teams) : [];
    if (teams.length === 0) {
        throw new Error("NO_TEAMS");
    }

    // 3. 문제 없다면 API를 통해 이메일 발송 요청
    await sendEmailViaFirebase(emailAddress, session.code);
    
    return true; // 성공 시 true 반환
}
