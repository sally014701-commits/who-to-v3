(function () {
    'use strict';

    function initEmailResultsEvents(ctx) {
        var firebase = ctx.firebase;
        var W = ctx.W;
        var state = ctx.state;

        var emailResultsOverlay = document.getElementById('email-results-overlay');
        var emailResultsForm = document.getElementById('email-results-form');
        var emailResultsInput = document.getElementById('email-results-input');
        var emailResultsSubmit = document.getElementById('btn-email-results-submit');

        document.getElementById('btn-email-results') && document.getElementById('btn-email-results').addEventListener('click', function () {
            if (emailResultsOverlay) {
                if (W.i18n && W.i18n.applyToPage) W.i18n.applyToPage();
                emailResultsOverlay.classList.add('email-results-visible');
                if (emailResultsInput) emailResultsInput.value = '';
            }
        });

        document.getElementById('email-results-close') && document.getElementById('email-results-close').addEventListener('click', function () {
            if (emailResultsOverlay) emailResultsOverlay.classList.remove('email-results-visible');
        });

        if (emailResultsOverlay) {
            emailResultsOverlay.addEventListener('click', function (e) {
                if (e.target === emailResultsOverlay) emailResultsOverlay.classList.remove('email-results-visible');
            });
        }

        if (emailResultsForm) {
            emailResultsForm.addEventListener('submit', async function (e) {
                e.preventDefault();
                var email = emailResultsInput && emailResultsInput.value.trim();
                if (!email) return;

                var confirmMsg = (W.i18n && W.i18n.t) ? W.i18n.t('emailResultsConfirm') : '이메일로 전송하시겠습니까?';
                if (!confirm(confirmMsg)) return;

                var session = state.currentSession;
                if (!session || !session.code) {
                    alert((W.i18n && W.i18n.t) ? W.i18n.t('emailResultsError') : '세션이 없습니다.');
                    return;
                }

                var teams = session.teams ? Object.values(session.teams) : [];
                if (teams.length === 0) {
                    alert((W.i18n && W.i18n.t) ? W.i18n.t('emailResultsNoTeams') : '매칭된 팀이 없습니다. 먼저 매칭을 실행하세요.');
                    return;
                }

                if (emailResultsSubmit) emailResultsSubmit.disabled = true;
                try {
                    await firebase.sendTeamResultsEmail(email, session.code);
                    var successMsg = (W.i18n && W.i18n.t) ? W.i18n.t('emailResultsSuccess') : '전송되었습니다. 이메일을 확인해주세요.';
                    alert(successMsg);
                    emailResultsOverlay.classList.remove('email-results-visible');
                    emailResultsForm.reset();
                } catch (err) {
                    var errMsg = (err && err.message) ? err.message : ((W.i18n && W.i18n.t) ? W.i18n.t('emailResultsError') : '전송에 실패했습니다.');
                    alert(errMsg);
                } finally {
                    if (emailResultsSubmit) emailResultsSubmit.disabled = false;
                }
            });
        }
    }

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};
    window.WHO2MEET_legacy.initEmailResultsEvents = initEmailResultsEvents;
})();

