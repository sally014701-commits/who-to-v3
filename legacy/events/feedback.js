(function () {
    'use strict';

    function initFeedbackEvents(ctx) {
        var W = ctx.W;
        var firebase = ctx.firebase;

        var feedbackOverlay = document.getElementById('feedback-overlay');
        var feedbackForm = document.getElementById('feedback-form');
        var feedbackContent = document.getElementById('feedback-content');
        var feedbackIncludeEmail = document.getElementById('feedback-include-email');
        var feedbackEmailWrap = document.getElementById('feedback-email-wrap');
        var feedbackEmail = document.getElementById('feedback-email');

        document.getElementById('btn-feedback') && document.getElementById('btn-feedback').addEventListener('click', function (e) {
            e.preventDefault();
            if (feedbackOverlay) feedbackOverlay.classList.add('feedback-visible');
        });

        document.getElementById('feedback-close') && document.getElementById('feedback-close').addEventListener('click', function () {
            if (feedbackOverlay) feedbackOverlay.classList.remove('feedback-visible');
        });

        if (feedbackOverlay) {
            feedbackOverlay.addEventListener('click', function (e) {
                if (e.target === feedbackOverlay) feedbackOverlay.classList.remove('feedback-visible');
            });
        }

        if (feedbackIncludeEmail && feedbackEmailWrap) {
            feedbackIncludeEmail.addEventListener('change', function () {
                feedbackEmailWrap.style.display = feedbackIncludeEmail.checked ? 'block' : 'none';
                if (!feedbackIncludeEmail.checked && feedbackEmail) feedbackEmail.value = '';
            });
        }

        if (feedbackForm) {
            feedbackForm.addEventListener('submit', async function (e) {
                e.preventDefault();
                var content = feedbackContent && feedbackContent.value.trim();
                if (!content) return;

                var confirmMsg = (W.i18n && W.i18n.t) ? W.i18n.t('feedbackConfirm') : '보내시겠습니까?';
                if (!confirm(confirmMsg)) return;

                var email = (feedbackIncludeEmail && feedbackIncludeEmail.checked && feedbackEmail) ? feedbackEmail.value.trim() : '';
                try {
                    await firebase.saveFeedbackInDB({ content: content, email: email });
                    var successMsg = (W.i18n && W.i18n.t) ? W.i18n.t('feedbackSuccess') : '감사합니다! 피드백이 전송되었습니다.';
                    alert(successMsg);
                    feedbackOverlay.classList.remove('feedback-visible');
                    feedbackForm.reset();
                    if (feedbackEmailWrap) feedbackEmailWrap.style.display = 'none';
                    if (feedbackIncludeEmail) feedbackIncludeEmail.checked = false;
                } catch (err) {
                    var errMsg = (W.i18n && W.i18n.t) ? W.i18n.t('feedbackError') : '전송에 실패했습니다.';
                    alert(errMsg);
                }
            });
        }
    }

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};
    window.WHO2MEET_legacy.initFeedbackEvents = initFeedbackEvents;
})();

