(function () {
    'use strict';

    function initInstructorReloginEvents(ctx) {
        var W = ctx.W;
        var firebase = ctx.firebase;
        var render = ctx.render;
        var nav = ctx.nav;
        var state = ctx.state;

        var reloginCodeInput = document.getElementById('relogin-code');
        var reloginNameInput = document.getElementById('relogin-name');
        var reloginPasswordInput = document.getElementById('relogin-password');

        function validateReloginForm() {
            var code = reloginCodeInput && reloginCodeInput.value.trim();
            var name = reloginNameInput && reloginNameInput.value.trim();
            var password = reloginPasswordInput && reloginPasswordInput.value.trim();
            var btn = document.getElementById('btn-instructor-login');
            if (btn) btn.disabled = !code || code.length !== 6 || !name || !password;
        }

        if (reloginCodeInput) reloginCodeInput.addEventListener('input', function (e) { e.target.value = e.target.value.toUpperCase(); validateReloginForm(); });
        if (reloginNameInput) reloginNameInput.addEventListener('input', validateReloginForm);
        if (reloginPasswordInput) reloginPasswordInput.addEventListener('input', validateReloginForm);

        document.getElementById('btn-instructor-login') && document.getElementById('btn-instructor-login').addEventListener('click', async function () {
            var code = (reloginCodeInput && reloginCodeInput.value.trim() || '').toUpperCase();
            var name = (reloginNameInput && reloginNameInput.value.trim()) || '';
            var password = (reloginPasswordInput && reloginPasswordInput.value.trim()) || '';

            try {
                var session = await firebase.getSessionByCode(code);
                if (!session) {
                    document.getElementById('relogin-error').textContent = 'Session not found. Check the code.';
                    return;
                }
                if (session.instructorName !== name || session.instructorPassword !== password) {
                    document.getElementById('relogin-error').textContent = 'Invalid name or password.';
                    return;
                }

                state.currentSession = session;
                state.isInstructor = true;

                firebase.listenToSession(code, function (updatedSession) {
                    state.currentSession = updatedSession;
                    if (state.currentScreen === 'instructor-dashboard') render.renderDashboard();
                    else if (state.currentScreen === 'results') {
                        var teams = Object.values(updatedSession.teams || {});
                        document.getElementById('results-title').textContent = 'All Teams';
                        var backBtn = document.getElementById('btn-back-dashboard');
                        if (backBtn) backBtn.style.display = 'block';
                        render.renderTeams(teams, true);
                    }
                });

                if (reloginCodeInput) reloginCodeInput.value = '';
                if (reloginNameInput) reloginNameInput.value = '';
                if (reloginPasswordInput) reloginPasswordInput.value = '';
                document.getElementById('relogin-error').textContent = '';

                render.renderDashboard();
                nav.showScreen('instructor-dashboard');
            } catch (err) {
                document.getElementById('relogin-error').textContent = 'Error: ' + err.message;
            }
        });
    }

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};
    window.WHO2MEET_legacy.initInstructorReloginEvents = initInstructorReloginEvents;
})();

