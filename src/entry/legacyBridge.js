import { initMatchingEventsController } from '../ui/matching/matchingEventsController.js';
import { initFeedbackEventsController } from '../features/feedback/feedbackController.js';
import { initStudentJoinController } from '../features/student-join/studentJoinController.js';
import { initCreateSessionController } from '../features/create-session/createSessionController.js';
import { initProfileController } from '../features/profile/profileController.js';
import { initDashboardController } from '../features/instructor-dashboard/dashboardController.js';
import { initEmailController } from '../features/email-results/emailController.js';
import { initReloginController } from '../features/instructor-relogin/reloginController.js';

// Bridge: legacy/init-events.js calls window.WHO2MEET_legacy.initMatchingEvents(ctx).
// This module replaces only the matching-events init with a clean-arch controller.
(function () {
    'use strict';

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};

    window.WHO2MEET_legacy.initMatchingEvents = function (ctx) {
        initMatchingEventsController(ctx);
    };

    // Clean Architecture로 전환된 새로운 컨트롤러 직접 실행
    // window.WHO2MEET_initEvents 보다 이후에 실행되므로 W 객체를 바로 넘길 수 있음
    setTimeout(() => {
        if (window.WHO2MEET) {
            initFeedbackEventsController(window.WHO2MEET);
            initStudentJoinController(window.WHO2MEET);
            initCreateSessionController(window.WHO2MEET);
            initProfileController(window.WHO2MEET);
            initDashboardController(window.WHO2MEET);
            initEmailController(window.WHO2MEET);
            initReloginController(window.WHO2MEET);
        }
    }, 0);
})();

