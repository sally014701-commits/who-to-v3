import { submitStudentProfile, checkSessionStatus, listenToSessionUpdates } from './profileService.js';

function bindEvent(id, event, handler) {
    const el = document.getElementById(id);
    if (el) el.addEventListener(event, handler);
    return el;
}

// Controller (UI) 레이어: 학생이 태그를 클릭하거나 슬라이더를 움직일 때 화면을 조작합니다.
export function initProfileController(W) {
    const { state, render, nav } = W;

    // 1. 역할 태그 클릭
    bindEvent('role-tags', 'click', (e) => {
        const tagItem = e.target.closest('.tag-item');
        if (!tagItem) return;
        const tagId = tagItem.dataset.tagId;
        const index = state.selectedRoles.indexOf(tagId);
        
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

    // 2. 관심사 태그 클릭
    bindEvent('interest-tags', 'click', (e) => {
        const tagItem = e.target.closest('.tag-item');
        if (!tagItem) return;
        const tagId = tagItem.dataset.tagId;
        const index = state.selectedInterests.indexOf(tagId);
        
        if (index === -1) state.selectedInterests.push(tagId);
        else state.selectedInterests.splice(index, 1);
        
        const customGroup = document.getElementById('custom-interest-group');
        if (customGroup) customGroup.style.display = state.selectedInterests.includes('others') ? 'block' : 'none';
        
        render.renderInterestTags();
        render.validateProfileStep();
    });

    const customInterest = document.getElementById('custom-interest');
    if (customInterest) customInterest.addEventListener('input', render.validateProfileStep);
    
    const messageToTeam = document.getElementById('message-to-team');
    if (messageToTeam) messageToTeam.addEventListener('input', render.validateProfileStep);

    // 3. 외향성 슬라이더 조작
    const extroversionSlider = document.getElementById('extroversion-slider');
    if (extroversionSlider) {
        extroversionSlider.addEventListener('input', () => {
            const val = parseInt(extroversionSlider.value, 10) || 5;
            state.extroversionScore = Math.max(0, Math.min(10, val));
            const valueEl = document.getElementById('extroversion-value');
            if (valueEl) valueEl.textContent = state.extroversionScore;
        });
    }

    // 4. 영어 레벨 클릭
    bindEvent('english-level-grid', 'click', (e) => {
        const card = e.target.closest('.english-level-card');
        if (!card) return;
        const level = parseInt(card.dataset.level, 10);
        state.selectedEnglishLevel = level;
        
        document.querySelectorAll('.english-level-card').forEach((c) => {
            c.classList.toggle('selected', parseInt(c.dataset.level, 10) === level);
        });
        render.validateProfileStep();
    });

    // 5. 토론 질문 클릭
    bindEvent('discussion-question-list', 'click', (e) => {
        const item = e.target.closest('.discussion-question-item');
        if (!item) return;
        const qId = item.dataset.qId;
        state.selectedDiscussionQuestion = qId;
        
        document.querySelectorAll('.discussion-question-item').forEach((el) => {
            el.classList.toggle('selected', el.dataset.qId === qId);
        });
        render.validateProfileStep();
    });

    // 6. [뒤로 가기] 버튼 클릭
    bindEvent('btn-profile-back', 'click', () => {
        if (state.profileStep === 1) nav.showScreen('landing');
        else render.renderProfileStep(state.profileStep - 1);
    });

    // 7. [다음(완료)] 버튼 클릭 - 핵심!
    bindEvent('btn-profile-next', 'click', async () => {
        const visibleSteps = render.getVisibleProfileSteps ? render.getVisibleProfileSteps(state.currentSession) : ['role', 'interest', 'message'];
        
        if (state.profileStep < visibleSteps.length) {
            // 아직 입력할 게 남았으면 다음 단계 화면 보여주기
            render.renderProfileStep(state.profileStep + 1);
        } else {
            // 전부 입력했으면 서버에 저장 의뢰 (서비스 계층 호출)
            const cInterest = (document.getElementById('custom-interest') && document.getElementById('custom-interest').value || '').trim();
            const msgToTeam = (document.getElementById('message-to-team') && document.getElementById('message-to-team').value || '').trim();
            
            try {
                const result = await submitStudentProfile(W, cInterest, msgToTeam);

                // 반환된 결과(result)에 따라 화면 이동(라우팅)
                if (result.status === 'published_assigned') {
                    // 팀에 바로 배정된 경우
                    document.getElementById('results-title').textContent = 'Your Team';
                    render.renderTeams([result.team]);
                    nav.showScreen('results');
                    
                    // 나중에 팀원이 추가될 수 있으므로 화면 갱신 구독
                    listenToSessionUpdates(result.sessionCode, (nextSession) => {
                        state.currentSession = nextSession;
                        if (state.currentScreen === 'results' && state.currentStudent) {
                            const nextTeams = Object.values(nextSession.teams || {});
                            const nextMyTeam = nextTeams.find(t => t.memberIds && t.memberIds.includes(state.currentStudent.id));
                            if (nextMyTeam) {
                                document.getElementById('results-title').textContent = 'Your Team';
                                render.renderTeams([nextMyTeam]);
                            }
                        }
                    });
                } else if (result.status === 'published_wait' || result.status === 'waiting') {
                    // 아직 매칭 중이거나 배정이 늦어지는 경우
                    listenToSessionUpdates(result.sessionCode, (updatedSession) => {
                        state.currentSession = updatedSession;
                        if (updatedSession.status === 'published') {
                            const teams = updatedSession.teams ? Object.values(updatedSession.teams) : [];
                            const myTeam = teams.find(t => t.memberIds && t.memberIds.includes(state.currentStudent.id));
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
        }
    });

    // 8. 대기실에서 "지금은 어떤가요?" 버튼 클릭 (Session 상태 확인)
    bindEvent('btn-check-status', 'click', async () => {
        try {
            const { isPublished, myTeam } = await checkSessionStatus(W);
            
            if (isPublished) {
                document.getElementById('results-title').textContent = 'Your Team';
                render.renderTeams(myTeam ? [myTeam] : []);
                nav.showScreen('results');
            }
        } catch (err) {
            console.error(err);
        }
    });
}
