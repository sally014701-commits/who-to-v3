(function () {
    'use strict';

    function initStudentJoinEvents(ctx) {
        var firebase = ctx.firebase;
        var render = ctx.render;
        var nav = ctx.nav;
        var utils = ctx.utils;
        var state = ctx.state;

        var studentNameInput = document.getElementById('student-name');
        var studentPasswordInput = document.getElementById('student-password');

        function validateJoinForm() {
            var name = studentNameInput && studentNameInput.value.trim();
            var password = studentPasswordInput && studentPasswordInput.value.trim();
            var btn = document.getElementById('btn-join-session');
            if (btn) btn.disabled = !name || !password;
        }

        if (studentNameInput) studentNameInput.addEventListener('input', validateJoinForm);
        if (studentPasswordInput) studentPasswordInput.addEventListener('input', validateJoinForm);

        document.getElementById('btn-join-session') && document.getElementById('btn-join-session').addEventListener('click', async function () {
            var code = document.getElementById('display-join-code').textContent;
            var name = (studentNameInput && studentNameInput.value.trim()) || '';
            var password = (studentPasswordInput && studentPasswordInput.value.trim()) || '';
            var emojiInput = (document.getElementById('student-emoji') && document.getElementById('student-emoji').value || '').trim().slice(0, 4);

            try {
                var session = await firebase.getSessionByCode(code);
                if (!session) {
                    document.getElementById('join-error').textContent = 'Session not found. Check the code.';
                    return;
                }

                state.currentSession = session;

                var students = session.students || {};
                var existingStudent = Object.values(students).find(function (s) { return s.name.toLowerCase() === name.toLowerCase(); });

                if (existingStudent) {
                    if (existingStudent.password !== password) {
                        document.getElementById('join-error').textContent = 'Wrong password.';
                        return;
                    }

                    if (emojiInput) {
                        existingStudent.emoji = emojiInput;
                        await firebase.saveStudentInDB(code, existingStudent);
                    }

                    state.currentStudent = existingStudent;

                    if (existingStudent.roleTagIds && existingStudent.roleTagIds.length > 0) {
                        if (session.status === 'published') {
                            var teams = session.teams ? Object.values(session.teams) : [];
                            var myTeam = teams.find(function (t) { return t.memberIds && t.memberIds.includes(existingStudent.id); });
                            document.getElementById('results-title').textContent = 'Your Team';
                            render.renderTeams(myTeam ? [myTeam] : []);
                            nav.showScreen('results');
                        } else {
                            firebase.listenToSession(code, function (updatedSession) {
                                state.currentSession = updatedSession;
                                if (updatedSession.status === 'published') {
                                    var teamsList = updatedSession.teams ? Object.values(updatedSession.teams) : [];
                                    var myTeam = teamsList.find(function (t) { return t.memberIds && t.memberIds.includes(state.currentStudent.id); });
                                    document.getElementById('results-title').textContent = 'Your Team';
                                    render.renderTeams(myTeam ? [myTeam] : []);
                                    nav.showScreen('results');
                                }
                            });
                            nav.showScreen('waiting');
                        }
                    } else {
                        render.renderRoleTags();
                        render.renderInterestTags();
                        render.renderProfileStep(1);
                        nav.showScreen('profile-input');
                    }
                } else {
                    var newStudent = {
                        id: utils.generateId(),
                        name: name,
                        emoji: emojiInput || '',
                        password: password,
                        roleTagIds: [],
                        interestTagIds: [],
                        customInterest: '',
                        messageToTeam: '',
                        teamId: null
                    };

                    await firebase.saveStudentInDB(code, newStudent);
                    state.currentStudent = newStudent;

                    render.renderRoleTags();
                    render.renderInterestTags();
                    render.renderProfileStep(1);
                    nav.showScreen('profile-input');
                }
            } catch (err) {
                document.getElementById('join-error').textContent = 'Error: ' + err.message;
            }
        });
    }

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};
    window.WHO2MEET_legacy.initStudentJoinEvents = initStudentJoinEvents;
})();

