import { processCreateSession, validateParamRules, listenToSessionUpdates } from './createSessionService.js';

function bindEvent(id, event, handler) {
    const el = document.getElementById(id);
    if (el) el.addEventListener(event, handler);
    return el;
}

function getMsg(W, key, fallback) {
    return (W.i18n && W.i18n.t) ? W.i18n.t(key) : fallback;
}

// Controller (UI) 레이어: 화면의 버튼 클릭, 글자 입력 등 사용자의 행동을 감지하고 화면을 갱신합니다.
export function initCreateSessionController(W) {
    const { render, nav, tags } = W;
    const paramsMod = W.params || {};

    const sessionNameInput = document.getElementById('session-name');
    const instructorNameInput = document.getElementById('instructor-name');
    const instructorPasswordInput = document.getElementById('instructor-password');
    const btnCreate = document.getElementById('btn-create-session');
    const errEl = document.getElementById('create-error');

    // UI 조작: 입력값들을 확인하여 [방 만들기] 버튼을 활성화/비활성화 시킵니다.
    const validateCreateForm = () => {
        const sessionName = sessionNameInput && sessionNameInput.value.trim();
        const name = instructorNameInput && instructorNameInput.value.trim();
        const password = instructorPasswordInput && instructorPasswordInput.value.trim();
        const selectedParams = paramsMod.getSelectedParams ? paramsMod.getSelectedParams() : [];
        const locked = paramsMod.isParamLocked ? paramsMod.isParamLocked() : false;
        
        const roleTags = (paramsMod.getCreateRoleTags || tags.getCreateRoleTags)();
        const interestTags = (paramsMod.getCreateInterestTags || tags.getCreateInterestTags)();
        
        const hasRoleTags = !selectedParams.includes('role') || roleTags.length > 0;
        const hasInterestTags = !selectedParams.includes('interest') || interestTags.length > 0;
        const hasEnoughParams = selectedParams.length >= 2;
        
        if (btnCreate) {
            btnCreate.disabled = !sessionName || !name || !password || !hasRoleTags || !hasInterestTags || !hasEnoughParams || !locked;
        }
    };

    if (sessionNameInput) sessionNameInput.addEventListener('input', validateCreateForm);
    if (instructorNameInput) instructorNameInput.addEventListener('input', validateCreateForm);
    if (instructorPasswordInput) instructorPasswordInput.addEventListener('input', validateCreateForm);

    // UI 조작: 태그 추가(+)/삭제(-) 버튼 동작 감지
    const paramTilesScroll = document.getElementById('param-tiles-scroll');
    if (paramTilesScroll) {
        paramTilesScroll.addEventListener('click', (e) => {
            if (e.target.classList.contains('btn-add-tag')) {
                const param = e.target.dataset.param;
                if (param === 'role' && paramsMod.appendCreateRoleTagRow) paramsMod.appendCreateRoleTagRow('', '');
                else if (param === 'interest' && paramsMod.appendCreateInterestTagRow) paramsMod.appendCreateInterestTagRow('', '');
                else if (param === 'discussionQuestion' && paramsMod.appendCreateQuestionRow) paramsMod.appendCreateQuestionRow('');
                validateCreateForm();
            }
            if (e.target.classList.contains('btn-remove-tag')) {
                const row = e.target.closest('.create-tag-row');
                if (row) row.remove();
                validateCreateForm();
            }
        });
        paramTilesScroll.addEventListener('input', validateCreateForm);
    }

    // 화면 동작: [설정 완료] 버튼 클릭 시
    bindEvent('btn-param-done', 'click', () => {
        // 서비스에게 규칙 위반이 없는지 검사(validate) 요청
        const validationResult = validateParamRules(W);
        
        // 결과에 따라 에러 메시지 띄우기
        if (validationResult === "MIN_PARAMS") {
            if (errEl) errEl.textContent = getMsg(W, 'createErrorMinParams', 'Select at least 2 parameters.');
            return;
        }
        if (validationResult === "MIN_ROLE") {
            if (errEl) errEl.textContent = getMsg(W, 'createErrorMinRole', 'Add at least one role tag.');
            return;
        }
        if (validationResult === "MIN_INTEREST") {
            if (errEl) errEl.textContent = getMsg(W, 'createErrorMinInterest', 'Add at least one interest tag.');
            return;
        }
        if (validationResult === "MIN_QUESTION") {
            if (errEl) errEl.textContent = getMsg(W, 'createErrorMinQuestion', 'Add at least one discussion question.');
            return;
        }
        
        // 문제 없으면 가중치 영역 보여주기 조작
        if (errEl) errEl.textContent = '';
        if (paramsMod.lockParamsAndShowWeights && paramsMod.lockParamsAndShowWeights()) {
            validateCreateForm();
        }
    });

    // 메인 동작: 최종 [방 만들기] 버튼 클릭 시
    bindEvent('btn-create-session', 'click', async () => {
        // 화면에 입력된 글자들 수집
        const sessionName = (sessionNameInput && sessionNameInput.value.trim()) || '';
        const instructorName = (instructorNameInput && instructorNameInput.value.trim()) || '';
        const instructorEmojiEl = document.getElementById('instructor-emoji');
        const instructorEmoji = (instructorEmojiEl && instructorEmojiEl.value || '').trim().slice(0, 4);
        const instructorPassword = (instructorPasswordInput && instructorPasswordInput.value.trim()) || '';
        
        const teamSizeEl = document.getElementById('team-size');
        const teamSize = parseInt((teamSizeEl && teamSizeEl.value) || '4', 10);

        try {
            // 서비스(매니저) 계층에 "이 정보들로 방을 만들어 줘" 라고 의뢰
            const newSession = await processCreateSession(
                sessionName, 
                instructorName, 
                instructorPassword, 
                instructorEmoji, 
                teamSize, 
                W
            );
            
            if (errEl) errEl.textContent = '';

            // 방이 성공적으로 생성되었으므로, 실시간 감지 구독을 켜고 대시보드로 이동!
            listenToSessionUpdates(newSession.code, (updatedSession) => {
                W.state.currentSession = updatedSession;
                if (W.state.currentScreen === 'instructor-dashboard') {
                    render.renderDashboard();
                } else if (W.state.currentScreen === 'results') {
                    const teams = Object.values(updatedSession.teams || {});
                    document.getElementById('results-title').textContent = 'All Teams';
                    const backBtn = document.getElementById('btn-back-dashboard');
                    if (backBtn) backBtn.style.display = 'block';
                    render.renderTeams(teams, true);
                }
            });
            
            // 화면 이동(라우팅) 조작
            render.renderDashboard();
            nav.showScreen('instructor-dashboard');

        } catch (err) {
            // 서비스에서 에러(거절)를 던지면 화면에 빨간 글씨 띄우기
            if (err.message === "NOT_LOCKED") {
                if (errEl) errEl.textContent = getMsg(W, 'createErrorClickDone', 'Click "설정 완료" first.');
            } else if (err.message === "MIN_ROLE") {
                if (errEl) errEl.textContent = getMsg(W, 'createErrorMinRole', 'Add at least one role tag.');
            } else if (err.message === "MIN_INTEREST") {
                if (errEl) errEl.textContent = getMsg(W, 'createErrorMinInterest', 'Add at least one interest tag.');
            } else if (err.message === "MIN_QUESTION") {
                if (errEl) errEl.textContent = getMsg(W, 'createErrorMinQuestion', 'Add at least one discussion question.');
            } else {
                if (errEl) errEl.textContent = 'Error: ' + err.message;
            }
        }
    });
}
