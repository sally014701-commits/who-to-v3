import { fetchSessionByCode, subscribeToSession } from './reloginApi.js';

// Service (비즈니스 로직) 레이어: 입력한 정보가 실제 서버의 방 정보(비밀번호 등)와 일치하는지 검증합니다.

export async function processInstructorRelogin(W, code, name, password) {
    // 1. 서버에서 방 정보를 가져옵니다.
    const session = await fetchSessionByCode(code);
    
    // 2. 방이 아예 없으면 에러
    if (!session) {
        throw new Error("NOT_FOUND");
    }
    
    // 3. 강사 이름이나 비밀번호가 다르면 에러
    if (session.instructorName !== name || session.instructorPassword !== password) {
        throw new Error("WRONG_AUTH");
    }
    
    // 4. 인증에 성공했으므로 상태(State)를 갱신합니다.
    W.state.currentSession = session;
    W.state.isInstructor = true;
    
    return session;
}

export function listenToSessionUpdates(code, callback) {
    subscribeToSession(code, callback);
}
