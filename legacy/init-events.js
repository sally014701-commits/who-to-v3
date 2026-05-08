(function () {
    'use strict';

    function initEvents() {
        var W = window.WHO2MEET;
        if (!W) return;

        var ctx = {
            W: W,
            state: W.state,
            utils: W.utils,
            firebase: W.firebase,
            tags: W.tags,
            nav: W.nav,
            matching: W.matching,
            render: W.render,
            i18n: W.i18n
        };

        var legacy = window.WHO2MEET_legacy || {};

        legacy.initNavigationEvents && legacy.initNavigationEvents(ctx);
        legacy.initFeedbackEvents && legacy.initFeedbackEvents(ctx);
        legacy.initInstructorReloginEvents && legacy.initInstructorReloginEvents(ctx);
        legacy.initStudentJoinEvents && legacy.initStudentJoinEvents(ctx);
        legacy.initInstructorCreateEvents && legacy.initInstructorCreateEvents(ctx);
        legacy.initProfileInputEvents && legacy.initProfileInputEvents(ctx);
        legacy.initMatchingEvents && legacy.initMatchingEvents(ctx);
        legacy.initEmailResultsEvents && legacy.initEmailResultsEvents(ctx);
    }

    window.WHO2MEET_initEvents = initEvents;
})();

