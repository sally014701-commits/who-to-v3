import { saveFeedback } from './feedbackApi.js';

export async function submitFeedback(content, email) {
    // Service (비즈니스 로직) 레이어: 데이터가 올바른지 검사하고 가공합니다.
    
    // 1. 데이터 다듬기 (앞뒤 공백 제거)
    const cleanContent = content ? content.trim() : '';
    const cleanEmail = email ? email.trim() : '';

    // 2. 검증 (비어있으면 에러 발생시켜서 UI(Controller)에게 알림)
    if (!cleanContent) {
        throw new Error("EMPTY_CONTENT");
    }

    // 3. 문제가 없으면 API 호출 (통신병에게 전달)
    await saveFeedback(cleanContent, cleanEmail);
    
    return true; // 성공
}
