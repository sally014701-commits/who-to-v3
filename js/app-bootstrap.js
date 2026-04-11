function setLanguageButtonLabel(langBtn, lang) {
    langBtn.textContent = lang === 'en' ? '한' : 'EN';
}

function renderLocalizedResults(appModules, root) {
    const { state, render, i18n } = appModules;
    const teams = state.currentSession?.teams ? Object.values(state.currentSession.teams) : [];
    const myTeam = state.currentStudent && teams.find((team) => team.memberIds?.includes(state.currentStudent.id));
    const showAll = !myTeam;
    const titleEl = root.getElementById('results-title');

    if (titleEl) titleEl.textContent = showAll ? i18n.t('allTeams') : i18n.t('yourTeam');
    render.renderTeams(showAll ? teams : [myTeam], showAll);
}

function syncLocalizedScreen(appModules, root = globalThis.document) {
    const { state, i18n, tutorial, render } = appModules;

    i18n.applyToPage(root);
    tutorial.refreshIfVisible();

    if (state.currentScreen === 'instructor-dashboard') {
        render.renderDashboard();
        return;
    }

    if (state.currentScreen === 'results') {
        renderLocalizedResults(appModules, root);
        return;
    }

    if (state.currentScreen === 'profile-input') {
        render.renderProfileStep(state.profileStep || 1);
    }
}

function initializeLanguageToggle(appModules, root = globalThis.document) {
    const { i18n } = appModules;
    const langBtn = root.getElementById('btn-lang-toggle');

    if (!langBtn) return;

    setLanguageButtonLabel(langBtn, i18n.getLang());
    langBtn.addEventListener('click', () => {
        const next = i18n.getLang() === 'en' ? 'ko' : 'en';
        i18n.setLang(next);
        setLanguageButtonLabel(langBtn, next);
        syncLocalizedScreen(appModules, root);
    });
}

function initializeLegacyEvents(globalTarget = globalThis) {
    if (typeof globalTarget.WHO2MEET_initEvents === 'function') {
        globalTarget.WHO2MEET_initEvents();
    }
}

function initializeUiFeatures(appModules) {
    const { landingRole, tutorial, copyserial, emojiPicker } = appModules;

    landingRole.initLandingRole();
    tutorial.initTutorial();
    copyserial.initCopySerial();
    emojiPicker.initEmojiPicker();
}

export function initializeApp(appModules, root = globalThis.document, globalTarget = globalThis) {
    initializeLanguageToggle(appModules, root);
    syncLocalizedScreen(appModules, root);
    initializeLegacyEvents(globalTarget);
    initializeUiFeatures(appModules);
}

export function bootstrapApp(appModules, root = globalThis.document, globalTarget = globalThis) {
    const start = () => initializeApp(appModules, root, globalTarget);

    if (root?.readyState === 'loading') {
        root.addEventListener('DOMContentLoaded', start, { once: true });
        return;
    }

    start();
}
