import { processStudentJoin, listenToSessionUpdates } from './studentJoinService.js';

// 공통 헬퍼 함수
function bindEvent(id, event, handler) {
    const el = document.getElementById(id);
    if (el) el.addEventListener(event, handler);
    return el;
}

function getMsg(W, key, fallback) {
    return (W.i18n && W.i18n.t) ? W.i18n.t(key) : fallback;
}

// Controller (UI) 레이어: 사용자의 클릭, 타이핑 등 화면 조작과 길잡이 역할만 담당합니다.
export function initStudentJoinController(W) {
    const { render, nav, state } = W;

    const joinCodeInput = document.getElementById('join-code');
    const btnGoJoin = document.getElementById('btn-go-join');
    
    // UI 조작: 6자리 코드를 입력해야만 [참여하기] 버튼이 눌리도록 활성화/비활성화 처리
    if (joinCodeInput) {
        joinCodeInput.addEventListener('input', (e) => {
            e.target.value = e.target.value.toUpperCase();
            if (btnGoJoin) btnGoJoin.disabled = e.target.value.length !== 6;
        });
    }

    const studentNameInput = document.getElementById('student-name');
    const studentPasswordInput = document.getElementById('student-password');
    const btnJoinSession = document.getElementById('btn-join-session');

    // UI 조작: 이름과 비밀번호를 모두 입력해야만 [방 입장] 버튼 활성화
    const validateJoinForm = () => {
        const name = studentNameInput && studentNameInput.value.trim();
        const password = studentPasswordInput && studentPasswordInput.value.trim();
        if (btnJoinSession) btnJoinSession.disabled = !name || !password;
    };

    if (studentNameInput) studentNameInput.addEventListener('input', validateJoinForm);
    if (studentPasswordInput) studentPasswordInput.addEventListener('input', validateJoinForm);

    // 메인 동작: [방 입장하기] 버튼을 클릭했을 때의 이벤트
    bindEvent('btn-join-session', 'click', async () => {
        // 1. 화면에서 사용자가 입력한 값들을 가져옵니다.
        const displayEl = document.getElementById('display-join-code');
        const code = displayEl ? displayEl.textContent : '';
        const name = (studentNameInput && studentNameInput.value.trim()) || '';
        const password = (studentPasswordInput && studentPasswordInput.value.trim()) || '';
        const emojiEl = document.getElementById('student-emoji');
        const emojiInput = (emojiEl && emojiEl.value || '').trim().slice(0, 4);
        const errEl = document.getElementById('join-error');

        try {
            // 2. 서비스(매니저) 계층에 "이 학생 정보 확인해 줘" 라고 데이터를 넘겨줍니다.
            const result = await processStudentJoin(code, name, password, emojiInput);
            
            // 3. 서비스가 건네준 결과(result)에 따라 "화면 이동(라우팅)"만 처리합니다.
            if (result.hasProfile) {
                // 이미 프로필(관심사/성향 등)까지 다 작성한 학생인 경우
                if (result.session.status === 'published') {
                    // 방장이 이미 매칭 버튼을 눌러 결과가 나왔다면 -> 매칭 결과창으로 이동!
                    const teams = result.session.teams ? Object.values(result.session.teams) : [];
                    const myTeam = teams.find(t => t.memberIds && t.memberIds.includes(result.student.id));
                    document.getElementById('results-title').textContent = 'Your Team';
                    render.renderTeams(myTeam ? [myTeam] : []);
                    nav.showScreen('results');
                } else {
                    // 아직 매칭 전이라면 -> 대기실 화면으로 이동! (실시간 화면 갱신 시작)
                    listenToSessionUpdates(code, (updatedSession) => {
                        state.currentSession = updatedSession;
                        if (updatedSession.status === 'published') {
                            const teamsList = updatedSession.teams ? Object.values(updatedSession.teams) : [];
                            const myTeam = teamsList.find(t => t.memberIds && t.memberIds.includes(state.currentStudent.id));
                            document.getElementById('results-title').textContent = 'Your Team';
                            render.renderTeams(myTeam ? [myTeam] : []);
                            nav.showScreen('results');
                        }
                    });
                    nav.showScreen('waiting');
                }
            } else {
                // 완전 신규 학생이거나 프로필을 작성 안 하고 튕긴 학생인 경우 -> 프로필 작성 창으로 이동!
                render.renderRoleTags();
                render.renderInterestTags();
                render.renderProfileStep(1);
                nav.showScreen('profile-input');
            }

        } catch (err) {
            // 4. 서비스 계층에서 오류(에러)를 던졌을 때 화면에 빨간 글씨로 띄워주는 UI 조작
            if (err.message === "SESSION_NOT_FOUND") {
                if (errEl) errEl.textContent = getMsg(W, 'joinErrorNotFound', 'Session not found. Check the code.');
            } else if (err.message === "WRONG_PASSWORD") {
                if (errEl) errEl.textContent = getMsg(W, 'joinErrorWrongPassword', 'Wrong password.');
            } else {
                if (errEl) errEl.textContent = 'Error: ' + err.message;
            }
        }
    });
}
