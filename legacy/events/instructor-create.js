(function () {
    'use strict';

    function initInstructorCreateEvents(ctx) {
        var firebase = ctx.firebase;
        var render = ctx.render;
        var nav = ctx.nav;
        var utils = ctx.utils;
        var tags = ctx.tags;
        var state = ctx.state;
        var W = ctx.W;

        var sessionNameInput = document.getElementById('session-name');
        var instructorNameInput = document.getElementById('instructor-name');
        var instructorPasswordInput = document.getElementById('instructor-password');
        var paramsMod = W.params || {};

        function validateCreateForm() {
            var sessionName = sessionNameInput && sessionNameInput.value.trim();
            var name = instructorNameInput && instructorNameInput.value.trim();
            var password = instructorPasswordInput && instructorPasswordInput.value.trim();
            var selectedParams = paramsMod.getSelectedParams ? paramsMod.getSelectedParams() : [];
            var locked = paramsMod.isParamLocked ? paramsMod.isParamLocked() : false;
            var roleTags = (paramsMod.getCreateRoleTags || tags.getCreateRoleTags)();
            var interestTags = (paramsMod.getCreateInterestTags || tags.getCreateInterestTags)();
            var hasRoleTags = !selectedParams.includes('role') || roleTags.length > 0;
            var hasInterestTags = !selectedParams.includes('interest') || interestTags.length > 0;
            var hasEnoughParams = selectedParams.length >= 2;
            var btn = document.getElementById('btn-create-session');
            if (btn) btn.disabled = !sessionName || !name || !password || !hasRoleTags || !hasInterestTags || !hasEnoughParams || !locked;
        }

        if (sessionNameInput) sessionNameInput.addEventListener('input', validateCreateForm);
        if (instructorNameInput) instructorNameInput.addEventListener('input', validateCreateForm);
        if (instructorPasswordInput) instructorPasswordInput.addEventListener('input', validateCreateForm);

        document.getElementById('param-tiles-scroll') && document.getElementById('param-tiles-scroll').addEventListener('click', function (e) {
            if (e.target.classList.contains('btn-add-tag')) {
                var param = e.target.dataset.param;
                if (param === 'role' && paramsMod.appendCreateRoleTagRow) paramsMod.appendCreateRoleTagRow('', '');
                else if (param === 'interest' && paramsMod.appendCreateInterestTagRow) paramsMod.appendCreateInterestTagRow('', '');
                else if (param === 'discussionQuestion' && paramsMod.appendCreateQuestionRow) paramsMod.appendCreateQuestionRow('');
                validateCreateForm();
            }
            if (e.target.classList.contains('btn-remove-tag')) {
                var row = e.target.closest('.create-tag-row');
                if (row) row.remove();
                validateCreateForm();
            }
        });

        document.getElementById('param-tiles-scroll') && document.getElementById('param-tiles-scroll').addEventListener('input', validateCreateForm);

        document.getElementById('btn-param-done') && document.getElementById('btn-param-done').addEventListener('click', function () {
            var selected = paramsMod.getSelectedParams ? paramsMod.getSelectedParams() : [];
            if (selected.length < 2) {
                document.getElementById('create-error').textContent = 'Select at least 2 parameters.';
                return;
            }

            var roleTags = (paramsMod.getCreateRoleTags || tags.getCreateRoleTags)();
            var interestTags = (paramsMod.getCreateInterestTags || tags.getCreateInterestTags)();
            var discussionQs = paramsMod.getCreateDiscussionQuestions ? paramsMod.getCreateDiscussionQuestions() : [];

            if (selected.includes('role') && roleTags.length === 0) {
                document.getElementById('create-error').textContent = 'Add at least one role tag.';
                return;
            }
            if (selected.includes('interest') && interestTags.length === 0) {
                document.getElementById('create-error').textContent = 'Add at least one interest tag.';
                return;
            }
            if (selected.includes('discussionQuestion') && discussionQs.length === 0) {
                document.getElementById('create-error').textContent = 'Add at least one discussion question.';
                return;
            }

            document.getElementById('create-error').textContent = '';
            if (paramsMod.lockParamsAndShowWeights && paramsMod.lockParamsAndShowWeights()) validateCreateForm();
        });

        document.getElementById('btn-create-session') && document.getElementById('btn-create-session').addEventListener('click', async function () {
            var sessionName = (sessionNameInput && sessionNameInput.value.trim()) || '';
            var instructorName = (instructorNameInput && instructorNameInput.value.trim()) || '';
            var instructorEmoji = (document.getElementById('instructor-emoji') && document.getElementById('instructor-emoji').value || '').trim().slice(0, 4);
            var instructorPassword = (instructorPasswordInput && instructorPasswordInput.value.trim()) || '';

            var code = utils.generateSessionCode();
            var teamSize = parseInt((document.getElementById('team-size') && document.getElementById('team-size').value) || '4', 10);

            var selectedParams = paramsMod.getSelectedParams ? paramsMod.getSelectedParams() : ['role', 'interest'];
            var weights = paramsMod.getWeightsForSession ? paramsMod.getWeightsForSession(selectedParams) : { role: 50, interest: 50 };

            var roleTags = (paramsMod.getCreateRoleTags || tags.getCreateRoleTags)();
            var interestTags = (paramsMod.getCreateInterestTags || tags.getCreateInterestTags)();
            var discussionQuestions = paramsMod.getCreateDiscussionQuestions ? paramsMod.getCreateDiscussionQuestions() : [];

            if (!paramsMod.isParamLocked || !paramsMod.isParamLocked()) {
                document.getElementById('create-error').textContent = 'Click "설정 완료" first.';
                return;
            }
            if (selectedParams.includes('role') && roleTags.length === 0) {
                document.getElementById('create-error').textContent = 'Add at least one role tag.';
                return;
            }
            if (selectedParams.includes('interest') && interestTags.length === 0) {
                document.getElementById('create-error').textContent = 'Add at least one interest tag.';
                return;
            }
            if (selectedParams.includes('discussionQuestion') && discussionQuestions.length === 0) {
                document.getElementById('create-error').textContent = 'Add at least one discussion question.';
                return;
            }

            var newSession = {
                id: utils.generateId(),
                code: code,
                name: sessionName,
                instructorName: instructorName,
                instructorEmoji: instructorEmoji || '',
                instructorPassword: instructorPassword,
                teamSize: teamSize,
                selectedParams: selectedParams,
                weights: weights,
                weightRole: weights.role || 0,
                weightInterest: weights.interest || 0,
                weightExtroversion: weights.extroversion || 0,
                weightEnglishLevel: weights.englishLevel || 0,
                weightDiscussionQuestion: weights.discussionQuestion || 0,
                status: 'open',
                students: {},
                teams: {},
                roleTags: roleTags,
                interestTags: interestTags,
                discussionQuestions: discussionQuestions
            };

            document.getElementById('create-error').textContent = '';

            try {
                await firebase.createSessionInDB(newSession);
                state.currentSession = newSession;
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

                render.renderDashboard();
                nav.showScreen('instructor-dashboard');
            } catch (err) {
                document.getElementById('create-error').textContent = 'Error: ' + err.message;
            }
        });
    }

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};
    window.WHO2MEET_legacy.initInstructorCreateEvents = initInstructorCreateEvents;
})();

