(function () {
    'use strict';

    function initProfileInputEvents(ctx) {
        var firebase = ctx.firebase;
        var render = ctx.render;
        var nav = ctx.nav;
        var state = ctx.state;

        document.getElementById('role-tags') && document.getElementById('role-tags').addEventListener('click', function (e) {
            var tagItem = e.target.closest('.tag-item');
            if (!tagItem) return;
            var tagId = tagItem.dataset.tagId;
            var index = state.selectedRoles.indexOf(tagId);
            if (index === -1) {
                if (state.selectedRoles.length >= 2) state.selectedRoles[1] = tagId;
                else state.selectedRoles.push(tagId);
            } else {
                state.selectedRoles.splice(index, 1);
            }
            render.renderRoleTags();
            render.updateRolePrioritySummary();
            render.validateProfileStep();
        });

        document.getElementById('interest-tags') && document.getElementById('interest-tags').addEventListener('click', function (e) {
            var tagItem = e.target.closest('.tag-item');
            if (!tagItem) return;
            var tagId = tagItem.dataset.tagId;
            var index = state.selectedInterests.indexOf(tagId);
            if (index === -1) state.selectedInterests.push(tagId);
            else state.selectedInterests.splice(index, 1);

            var customGroup = document.getElementById('custom-interest-group');
            if (customGroup) customGroup.style.display = state.selectedInterests.includes('others') ? 'block' : 'none';

            render.renderInterestTags();
            render.validateProfileStep();
        });

        document.getElementById('custom-interest') && document.getElementById('custom-interest').addEventListener('input', render.validateProfileStep);
        document.getElementById('message-to-team') && document.getElementById('message-to-team').addEventListener('input', render.validateProfileStep);

        var extroversionSlider = document.getElementById('extroversion-slider');
        if (extroversionSlider) {
            extroversionSlider.addEventListener('input', function () {
                var val = parseInt(extroversionSlider.value, 10) || 5;
                state.extroversionScore = Math.max(0, Math.min(10, val));
                var valueEl = document.getElementById('extroversion-value');
                if (valueEl) valueEl.textContent = state.extroversionScore;
            });
        }

        // English Level cards
        document.getElementById('english-level-grid') && document.getElementById('english-level-grid').addEventListener('click', function (e) {
            var card = e.target.closest('.english-level-card');
            if (!card) return;
            var level = parseInt(card.dataset.level, 10);
            state.selectedEnglishLevel = level;
            document.querySelectorAll('.english-level-card').forEach(function (c) {
                c.classList.toggle('selected', parseInt(c.dataset.level, 10) === level);
            });
            render.validateProfileStep();
        });

        // Discussion Question items
        document.getElementById('discussion-question-list') && document.getElementById('discussion-question-list').addEventListener('click', function (e) {
            var item = e.target.closest('.discussion-question-item');
            if (!item) return;
            var qId = item.dataset.qId;
            state.selectedDiscussionQuestion = qId;
            document.querySelectorAll('.discussion-question-item').forEach(function (el) {
                el.classList.toggle('selected', el.dataset.qId === qId);
            });
            render.validateProfileStep();
        });

        document.getElementById('btn-profile-back') && document.getElementById('btn-profile-back').addEventListener('click', function () {
            if (state.profileStep === 1) nav.showScreen('landing');
            else render.renderProfileStep(state.profileStep - 1);
        });

        document.getElementById('btn-profile-next') && document.getElementById('btn-profile-next').addEventListener('click', async function () {
            var visibleSteps = render.getVisibleProfileSteps ? render.getVisibleProfileSteps(state.currentSession) : ['role', 'interest', 'message'];
            if (state.profileStep < visibleSteps.length) {
                render.renderProfileStep(state.profileStep + 1);
                return;
            }

            var student = state.currentStudent;
            var session = state.currentSession;
            var selParams = session && session.selectedParams ? session.selectedParams : ['role', 'interest'];

            student.roleTagIds = selParams.includes('role') ? state.selectedRoles.slice() : [];
            student.interestTagIds = selParams.includes('interest') ? state.selectedInterests.slice() : [];
            student.customInterest = (document.getElementById('custom-interest') && document.getElementById('custom-interest').value || '').trim();
            student.extroversionScore = selParams.includes('extroversion') ? state.extroversionScore : undefined;
            student.englishLevel = selParams.includes('englishLevel') ? state.selectedEnglishLevel : undefined;
            student.discussionQuestionId = selParams.includes('discussionQuestion') ? state.selectedDiscussionQuestion : undefined;
            student.messageToTeam = (document.getElementById('message-to-team') && document.getElementById('message-to-team').value || '').trim();

            try {
                await firebase.saveStudentInDB(state.currentSession.code, student);
                state.selectedRoles = [];
                state.selectedInterests = [];
                state.selectedEnglishLevel = null;
                state.selectedDiscussionQuestion = null;

                var session = state.currentSession;
                if (session.status === 'published') {
                    var myTeam = await firebase.assignLateJoinerToTeam(session.code, session, student);
                    if (myTeam) {
                        state.currentStudent = student;
                        await new Promise(function (r) { setTimeout(r, 350); });
                        var updatedSession = await firebase.getSessionByCode(session.code);
                        state.currentSession = updatedSession;
                        var teams = Object.values(updatedSession.teams || {});
                        var myTeamFromSession = teams.find(function (t) { return t.memberIds && t.memberIds.includes(student.id); });
                        document.getElementById('results-title').textContent = 'Your Team';
                        render.renderTeams(myTeamFromSession ? [myTeamFromSession] : [myTeam]);
                        nav.showScreen('results');

                        firebase.listenToSession(session.code, function (nextSession) {
                            state.currentSession = nextSession;
                            if (state.currentScreen === 'results' && state.currentStudent) {
                                var nextTeams = Object.values(nextSession.teams || {});
                                var nextMyTeam = nextTeams.find(function (t) { return t.memberIds && t.memberIds.includes(state.currentStudent.id); });
                                if (nextMyTeam) {
                                    document.getElementById('results-title').textContent = 'Your Team';
                                    render.renderTeams([nextMyTeam]);
                                }
                            }
                        });
                    } else {
                        nav.showScreen('waiting');
                    }
                } else {
                    firebase.listenToSession(state.currentSession.code, function (updatedSession) {
                        state.currentSession = updatedSession;
                        if (updatedSession.status === 'published') {
                            var teams = updatedSession.teams ? Object.values(updatedSession.teams) : [];
                            var myTeam = teams.find(function (t) { return t.memberIds && t.memberIds.includes(student.id); });
                            document.getElementById('results-title').textContent = 'Your Team';
                            render.renderTeams(myTeam ? [myTeam] : []);
                            nav.showScreen('results');
                        }
                    });
                    nav.showScreen('waiting');
                }
            } catch (err) {
                alert('Error saving profile: ' + err.message);
            }
        });
    }

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};
    window.WHO2MEET_legacy.initProfileInputEvents = initProfileInputEvents;
})();

