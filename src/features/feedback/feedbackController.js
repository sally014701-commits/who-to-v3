import { submitFeedback } from './feedbackService.js';

// 공통 헬퍼 함수
function bindEvent(id, event, handler) {
    const el = document.getElementById(id);
    if (el) el.addEventListener(event, handler);
    return el;
}

function getMsg(W, key, fallback) {
    return (W.i18n && W.i18n.t) ? W.i18n.t(key) : fallback;
}

export function initFeedbackEventsController(W) {
    // Controller (UI) 레이어: 화면 요소를 찾고 이벤트를 달아주는 역할만 합니다.
    const feedbackOverlay = document.getElementById('feedback-overlay');
    const feedbackForm = document.getElementById('feedback-form');
    const feedbackContent = document.getElementById('feedback-content');
    const feedbackIncludeEmail = document.getElementById('feedback-include-email');
    const feedbackEmailWrap = document.getElementById('feedback-email-wrap');
    const feedbackEmail = document.getElementById('feedback-email');

    // 모달창 열기
    bindEvent('btn-feedback', 'click', (e) => {
        e.preventDefault();
        if (feedbackOverlay) feedbackOverlay.classList.add('feedback-visible');
    });

    // 모달창 닫기 (X 버튼)
    bindEvent('feedback-close', 'click', () => {
        if (feedbackOverlay) feedbackOverlay.classList.remove('feedback-visible');
    });

    // 모달창 닫기 (배경 클릭)
    if (feedbackOverlay) {
        feedbackOverlay.addEventListener('click', (e) => {
            if (e.target === feedbackOverlay) feedbackOverlay.classList.remove('feedback-visible');
        });
    }

    // 이메일 입력창 보이기/숨기기
    if (feedbackIncludeEmail && feedbackEmailWrap) {
        feedbackIncludeEmail.addEventListener('change', () => {
            feedbackEmailWrap.style.display = feedbackIncludeEmail.checked ? 'block' : 'none';
            if (!feedbackIncludeEmail.checked && feedbackEmail) feedbackEmail.value = '';
        });
    }

    // 폼 제출 (저장 로직)
    if (feedbackForm) {
        feedbackForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            
            // 1. 화면에서 값 읽어오기
            const content = feedbackContent ? feedbackContent.value : '';
            if (!content.trim()) return; // UI 단에서의 1차 방어

            // 2. 화면에 확인 알림 띄우기
            const confirmMsg = getMsg(W, 'feedbackConfirm', '보내시겠습니까?');
            if (!confirm(confirmMsg)) return;

            const email = (feedbackIncludeEmail && feedbackIncludeEmail.checked && feedbackEmail) ? feedbackEmail.value : '';
            
            try {
                // 3. 서비스(비즈니스 로직) 호출 - 실제 전송은 얘가 알아서 다 해줌
                await submitFeedback(content, email);
                
                // 4. 성공 시 화면 조작
                const successMsg = getMsg(W, 'feedbackSuccess', '감사합니다! 피드백이 전송되었습니다.');
                alert(successMsg);
                feedbackOverlay.classList.remove('feedback-visible');
                feedbackForm.reset();
                if (feedbackEmailWrap) feedbackEmailWrap.style.display = 'none';
                if (feedbackIncludeEmail) feedbackIncludeEmail.checked = false;
            } catch (err) {
                // 5. 실패 시 에러 화면 조작
                if (err.message === "EMPTY_CONTENT") {
                    alert("내용을 입력해주세요.");
                } else {
                    const errMsg = getMsg(W, 'feedbackError', '전송에 실패했습니다.');
                    alert(errMsg);
                }
            }
        });
    }
}
