export async function saveFeedback(content, email) {
    // API (Data) 레이어: 외부 데이터베이스(Firebase)와의 직접적인 통신만 담당합니다.
    const W = window.WHO2MEET;
    if (!W || !W.firebase) {
        throw new Error("Firebase 모듈이 로드되지 않았습니다.");
    }
    
    // 기존 firebase.js의 기능을 재사용합니다. (추후 DB가 바뀌면 여기만 수정하면 됩니다.)
    return await W.firebase.saveFeedbackInDB({ content, email });
}
