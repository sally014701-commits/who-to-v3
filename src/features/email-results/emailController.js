import { processEmailRequest } from './emailService.js';

function bindEvent(id, event, handler) {
    const el = document.getElementById(id);
    if (el) el.addEventListener(event, handler);
    return el;
}

function getMsg(W, key, fallback) {
    return (W.i18n && W.i18n.t) ? W.i18n.t(key) : fallback;
}

// Controller (UI) 레이어: 모달창 열기/닫기 및 이메일 입력폼 제출 이벤트를 담당합니다.
export function initEmailController(W) {
    const emailResultsOverlay = document.getElementById('email-results-overlay');
    const emailResultsForm = document.getElementById('email-results-form');
    const emailResultsInput = document.getElementById('email-results-input');
    const emailResultsSubmit = document.getElementById('btn-email-results-submit');

    // 1. [이메일 보내기] 아이콘 클릭 시 모달창 열기
    bindEvent('btn-email-results', 'click', () => {
        if (emailResultsOverlay) {
            // 다국어 번역 즉시 적용 (모달창 내부 글자들)
            if (W.i18n && W.i18n.applyToPage) W.i18n.applyToPage();
            emailResultsOverlay.classList.add('email-results-visible');
            if (emailResultsInput) emailResultsInput.value = '';
        }
    });

    // 2. 모달창 닫기 버튼(X) 클릭
    bindEvent('email-results-close', 'click', () => {
        if (emailResultsOverlay) emailResultsOverlay.classList.remove('email-results-visible');
    });

    // 3. 모달창 바깥(어두운 배경) 클릭 시 닫기
    if (emailResultsOverlay) {
        emailResultsOverlay.addEventListener('click', (e) => {
            if (e.target === emailResultsOverlay) emailResultsOverlay.classList.remove('email-results-visible');
        });
    }

    // 4. 모달창 내 [전송] 폼 제출 이벤트
    if (emailResultsForm) {
        emailResultsForm.addEventListener('submit', async (e) => {
            e.preventDefault(); // 페이지 새로고침 방지
            
            const email = emailResultsInput && emailResultsInput.value.trim();
            if (!email) return;

            // 사용자 확인창 (confirm)
            const confirmMsg = getMsg(W, 'emailResultsConfirm', '이메일로 전송하시겠습니까?');
            if (!confirm(confirmMsg)) return;

            // 중복 클릭 방지를 위해 버튼 비활성화
            if (emailResultsSubmit) emailResultsSubmit.disabled = true;
            
            try {
                // 서비스(매니저)에게 이메일 발송 작업 지시
                await processEmailRequest(W, email);
                
                // 성공하면 알림창 띄우고 모달 닫기
                const successMsg = getMsg(W, 'emailResultsSuccess', '전송되었습니다. 이메일을 확인해주세요.');
                alert(successMsg);
                emailResultsOverlay.classList.remove('email-results-visible');
                emailResultsForm.reset();

            } catch (err) {
                // 서비스에서 넘어온 에러(방 없음, 팀 없음 등) 처리
                let errMsg = '';
                if (err.message === "NO_SESSION") {
                    errMsg = getMsg(W, 'emailResultsError', '세션이 없습니다.');
                } else if (err.message === "NO_TEAMS") {
                    errMsg = getMsg(W, 'emailResultsNoTeams', '매칭된 팀이 없습니다. 먼저 매칭을 실행하세요.');
                } else {
                    errMsg = err.message || getMsg(W, 'emailResultsError', '전송에 실패했습니다.');
                }
                alert(errMsg);
            } finally {
                // 버튼 다시 활성화
                if (emailResultsSubmit) emailResultsSubmit.disabled = false;
            }
        });
    }
}
