(function () {
    'use strict';

    function initMatchingEvents(ctx) {
        var firebase = ctx.firebase;
        var matching = ctx.matching;
        var render = ctx.render;
        var nav = ctx.nav;
        var state = ctx.state;
        var W = ctx.W;

        document.getElementById('btn-check-status') && document.getElementById('btn-check-status').addEventListener('click', async function () {
            try {
                var session = await firebase.getSessionByCode(state.currentSession.code);
                state.currentSession = session;
                if (session && session.status === 'published') {
                    var teams = session.teams ? Object.values(session.teams) : [];
                    var myTeam = teams.find(function (t) { return t.memberIds && t.memberIds.includes(state.currentStudent.id); });
                    document.getElementById('results-title').textContent = 'Your Team';
                    render.renderTeams(myTeam ? [myTeam] : []);
                    nav.showScreen('results');
                }
            } catch (err) { console.error(err); }
        });

        document.getElementById('btn-refresh') && document.getElementById('btn-refresh').addEventListener('click', async function () {
            try {
                var session = await firebase.getSessionByCode(state.currentSession.code);
                state.currentSession = session;
                render.renderDashboard();
            } catch (err) { console.error(err); }
        });

        document.getElementById('btn-run-matching') && document.getElementById('btn-run-matching').addEventListener('click', async function () {
            var session = state.currentSession;
            if (session.status === 'published') {
                var teams = session.teams ? Object.values(session.teams) : [];
                document.getElementById('results-title').textContent = 'All Teams';
                var backBtn = document.getElementById('btn-back-dashboard');
                if (backBtn) backBtn.style.display = 'block';
                render.renderTeams(teams, true);
                nav.showScreen('results');
            } else {
                try {
                    var latestSession = await firebase.getSessionByCode(session.code);
                    state.currentSession = latestSession;
                    var teams = matching.runMatching(latestSession);
                    if (teams.length === 0) {
                        alert('No students have submitted their profiles yet!');
                        return;
                    }
                    var teamsObj = {};
                    teams.forEach(function (team) { teamsObj[team.id] = team; });
                    await firebase.saveTeamsInDB(session.code, teamsObj);
                    state.currentSession.teams = teamsObj;
                    state.currentSession.status = 'published';
                    render.renderDashboard();
                    document.getElementById('results-title').textContent = 'All Teams';
                    var backBtn = document.getElementById('btn-back-dashboard');
                    if (backBtn) backBtn.style.display = 'block';
                    render.renderTeams(teams, true);
                    nav.showScreen('results');
                } catch (err) {
                    alert('Error running matching: ' + err.message);
                }
            }
        });

        document.getElementById('btn-back-dashboard') && document.getElementById('btn-back-dashboard').addEventListener('click', function () {
            nav.showScreen('instructor-dashboard');
        });
    }

    window.WHO2MEET_legacy = window.WHO2MEET_legacy || {};
    window.WHO2MEET_legacy.initMatchingEvents = initMatchingEvents;
})();

