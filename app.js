(function () {
    'use strict';

    // ==========================================
    // Utility Helpers for Event Binding
    // ==========================================
    function bindEvent(id, event, handler) {
        const el = document.getElementById(id);
        if (el) el.addEventListener(event, handler);
        return el;
    }

    function getMsg(W, key, fallback) {
        return (W.i18n && W.i18n.t) ? W.i18n.t(key) : fallback;
    }

    // ==========================================
    // Feature-specific Initialization Functions
    // ==========================================
    
    function initNavigationEvents(W) {
        const { nav } = W;

        bindEvent('btn-go-join', 'click', () => {
            const codeEl = document.getElementById('join-code');
            const displayEl = document.getElementById('display-join-code');
            if (codeEl && displayEl) {
                displayEl.textContent = codeEl.value;
                nav.showScreen('join-session');
            }
        });

        bindEvent('btn-go-create', 'click', () => {
            if (W.params) {
                W.params.initCreateParams();
                W.params.populateDefaultTags();
            }
            nav.showScreen('create-session');
        });

        document.querySelectorAll('[data-go]').forEach((btn) => {
            btn.addEventListener('click', () => nav.showScreen(btn.dataset.go));
        });

        bindEvent('btn-instructor-relogin', 'click', (e) => {
            e.preventDefault();
            nav.showScreen('instructor-relogin');
        });

        bindEvent('logo-home', 'click', (e) => {
            e.preventDefault();
            nav.showScreen('landing');
        });

        bindEvent('btn-quick-test', 'click', (e) => {
            e.preventDefault();
            if (W.renderfortest && W.renderfortest.runQuickTest) {
                W.renderfortest.runQuickTest();
            }
        });
    }








    // ==========================================
    // Main Initialization
    // ==========================================
    function initEvents() {
        const W = window.WHO2MEET;
        if (!W) return;

        initNavigationEvents(W);
    }

    window.WHO2MEET_initEvents = initEvents;
})();
