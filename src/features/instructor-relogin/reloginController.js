import { processInstructorRelogin, listenToSessionUpdates } from './reloginService.js';

function bindEvent(id, event, handler) {
    const el = document.getElementById(id);
    if (el) el.addEventListener(event, handler);
    return el;
}

function getMsg(W, key, fallback) {
    return (W.i18n && W.i18n.t) ? W.i18n.t(key) : fallback;
}

// Controller (UI) 레이어: 재로그인 화면의 폼 입력을 감지하고 로그인 버튼 클릭 이벤트를 전담합니다.
export function initReloginController(W) {
    const { render, nav } = W;

    const reloginCodeInput = document.getElementById('relogin-code');
    const reloginNameInput = document.getElementById('relogin-name');
    const reloginPasswordInput = document.getElementById('relogin-password');
    const btnLogin = document.getElementById('btn-instructor-login');
    const errEl = document.getElementById('relogin-error');

    // UI 조작: 입력칸이 다 채워졌는지 확인해서 로그인 버튼 켜기/끄기
    const validateReloginForm = () => {
        const code = reloginCodeInput && reloginCodeInput.value.trim();
        const name = reloginNameInput && reloginNameInput.value.trim();
        const password = reloginPasswordInput && reloginPasswordInput.value.trim();
        if (btnLogin) {
            btnLogin.disabled = !code || code.length !== 6 || !name || !password;
        }
    };

    if (reloginCodeInput) {
        reloginCodeInput.addEventListener('input', (e) => {
            e.target.value = e.target.value.toUpperCase(); // 코드는 대문자로 강제 변환
            validateReloginForm();
        });
    }
    if (reloginNameInput) reloginNameInput.addEventListener('input', validateReloginForm);
    if (reloginPasswordInput) reloginPasswordInput.addEventListener('input', validateReloginForm);

    // 핵심 이벤트: [로그인] 버튼 클릭 시
    bindEvent('btn-instructor-login', 'click', async () => {
        const code = (reloginCodeInput && reloginCodeInput.value.trim() || '').toUpperCase();
        const name = (reloginNameInput && reloginNameInput.value.trim()) || '';
        const password = (reloginPasswordInput && reloginPasswordInput.value.trim()) || '';

        try {
            // 서비스 계층에 "이 정보로 인증 좀 해줘"라고 의뢰
            const session = await processInstructorRelogin(W, code, name, password);

            // 실시간 상태 업데이트 구독 (대시보드 또는 결과창 갱신)
            listenToSessionUpdates(code, (updatedSession) => {
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

            // 인증 성공 시 입력칸 비우고 에러창 지우기
            if (reloginCodeInput) reloginCodeInput.value = '';
            if (reloginNameInput) reloginNameInput.value = '';
            if (reloginPasswordInput) reloginPasswordInput.value = '';
            if (errEl) errEl.textContent = '';
            
            // 대시보드 화면으로 이동
            render.renderDashboard();
            nav.showScreen('instructor-dashboard');

        } catch (err) {
            // 서비스 계층에서 넘어온 거절(에러) 사유에 맞게 빨간 글씨 띄우기
            if (err.message === "NOT_FOUND") {
                if (errEl) errEl.textContent = getMsg(W, 'reloginErrorNotFound', 'Session not found. Check the code.');
            } else if (err.message === "WRONG_AUTH") {
                if (errEl) errEl.textContent = getMsg(W, 'reloginErrorWrongAuth', 'Invalid name or password.');
            } else {
                if (errEl) errEl.textContent = 'Error: ' + err.message;
            }
        }
    });
}
