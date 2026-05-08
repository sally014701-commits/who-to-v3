import { createSessionInDB, subscribeToSession } from './createSessionApi.js';

// Service (비즈니스 로직) 레이어: UI 화면과 무관하게 방(Session) 데이터를 완벽하게 조립하고 검증하는 '공장/두뇌' 역할을 합니다.

export async function processCreateSession(sessionName, instructorName, instructorPassword, instructorEmoji, teamSize, W) {
    if (!W) throw new Error("시스템이 준비되지 않았습니다.");
    const paramsMod = W.params || {};
    const tags = W.tags;

    // 파라미터(조건) 목록 및 가중치 가져오기
    const selectedParams = paramsMod.getSelectedParams ? paramsMod.getSelectedParams() : ['role', 'interest'];
    const weights = paramsMod.getWeightsForSession ? paramsMod.getWeightsForSession(selectedParams) : { role: 50, interest: 50 };
    
    // 강사가 설정한 태그 목록 가져오기
    const roleTags = (paramsMod.getCreateRoleTags || tags.getCreateRoleTags)();
    const interestTags = (paramsMod.getCreateInterestTags || tags.getCreateInterestTags)();
    const discussionQuestions = paramsMod.getCreateDiscussionQuestions ? paramsMod.getCreateDiscussionQuestions() : [];
    
    // 1. 방을 만들기 전 최종 비즈니스 검증 (방어 코드)
    if (!paramsMod.isParamLocked || !paramsMod.isParamLocked()) {
        throw new Error("NOT_LOCKED");
    }
    if (selectedParams.includes('role') && roleTags.length === 0) {
        throw new Error("MIN_ROLE");
    }
    if (selectedParams.includes('interest') && interestTags.length === 0) {
        throw new Error("MIN_INTEREST");
    }
    if (selectedParams.includes('discussionQuestion') && discussionQuestions.length === 0) {
        throw new Error("MIN_QUESTION");
    }

    // 2. 방(Session) 데이터 덩어리 조립
    const code = W.utils.generateSessionCode();
    const newSession = {
        id: W.utils.generateId(),
        code,
        name: sessionName,
        instructorName,
        instructorEmoji: instructorEmoji || '',
        instructorPassword,
        teamSize,
        selectedParams,
        weights,
        weightRole: weights.role || 0,
        weightInterest: weights.interest || 0,
        weightExtroversion: weights.extroversion || 0,
        weightEnglishLevel: weights.englishLevel || 0,
        weightDiscussionQuestion: weights.discussionQuestion || 0,
        status: 'open',
        students: {},
        teams: {},
        roleTags,
        interestTags,
        discussionQuestions
    };

    // 3. API 호출하여 서버에 방 생성
    await createSessionInDB(newSession);

    // 4. 상태 갱신
    W.state.currentSession = newSession;
    W.state.isInstructor = true;

    return newSession;
}

// [설정 완료] 버튼 클릭 시 호출되는 검증 규칙
export function validateParamRules(W) {
    const paramsMod = W.params || {};
    const tags = W.tags;
    
    const selected = paramsMod.getSelectedParams ? paramsMod.getSelectedParams() : [];
    if (selected.length < 2) return "MIN_PARAMS";
    
    const roleTags = (paramsMod.getCreateRoleTags || tags.getCreateRoleTags)();
    const interestTags = (paramsMod.getCreateInterestTags || tags.getCreateInterestTags)();
    const discussionQs = paramsMod.getCreateDiscussionQuestions ? paramsMod.getCreateDiscussionQuestions() : [];
    
    if (selected.includes('role') && roleTags.length === 0) return "MIN_ROLE";
    if (selected.includes('interest') && interestTags.length === 0) return "MIN_INTEREST";
    if (selected.includes('discussionQuestion') && discussionQs.length === 0) return "MIN_QUESTION";
    
    return "OK";
}

export function listenToSessionUpdates(code, callback) {
    subscribeToSession(code, callback);
}
