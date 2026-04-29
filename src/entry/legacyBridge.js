import { initMatchingEventsController } from '../ui/matching/matchingEventsController.js';

// Bridge: legacy/init-events.js calls window.WHO2MEET_legacy.initMatchingEvents(ctx).
// This module replaces only the matching-events init with a clean-arch controller.
(function () {
    'use strict';

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};

    window.WHO2MEET_legacy.initMatchingEvents = function (ctx) {
        initMatchingEventsController(ctx);
    };
})();

