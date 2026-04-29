(function () {
    'use strict';

    function initNavigationEvents(ctx) {
        var W = ctx.W;
        var nav = ctx.nav;

        var joinCodeInput = document.getElementById('join-code');
        if (joinCodeInput) {
            joinCodeInput.addEventListener('input', function (e) {
                e.target.value = e.target.value.toUpperCase();
                document.getElementById('btn-go-join').disabled = e.target.value.length !== 6;
            });
        }

        document.getElementById('btn-go-join') && document.getElementById('btn-go-join').addEventListener('click', function () {
            var codeEl = document.getElementById('join-code');
            var displayEl = document.getElementById('display-join-code');
            if (codeEl && displayEl) {
                displayEl.textContent = codeEl.value;
                nav.showScreen('join-session');
            }
        });

        document.getElementById('btn-go-create') && document.getElementById('btn-go-create').addEventListener('click', function () {
            if (W.params) {
                W.params.initCreateParams();
                W.params.populateDefaultTags();
            }
            nav.showScreen('create-session');
        });

        document.querySelectorAll('[data-go]').forEach(function (btn) {
            btn.addEventListener('click', function () { nav.showScreen(btn.dataset.go); });
        });

        document.getElementById('btn-instructor-relogin') && document.getElementById('btn-instructor-relogin').addEventListener('click', function (e) {
            e.preventDefault();
            nav.showScreen('instructor-relogin');
        });

        document.getElementById('logo-home') && document.getElementById('logo-home').addEventListener('click', function (e) {
            e.preventDefault();
            nav.showScreen('landing');
        });

        document.getElementById('btn-quick-test') && document.getElementById('btn-quick-test').addEventListener('click', function (e) {
            e.preventDefault();
            if (W.renderfortest && W.renderfortest.runQuickTest) {
                W.renderfortest.runQuickTest();
            }
        });
    }

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};
    window.WHO2MEET_legacy.initNavigationEvents = initNavigationEvents;
})();

