import { saveStudentProfile, assignLateJoiner, fetchLatestSession, subscribeToSession } from './profileApi.js';

// Service (비즈니스 로직) 레이어: 학생이 작성한 프로필을 정리하고, 지각생(이미 방 매칭이 끝난 경우)인지 판단합니다.

export async function submitStudentProfile(W, customInterest, messageToTeam) {
    const student = W.state.currentStudent;
    const session = W.state.currentSession;
    
    // 방 설정에서 선택된 파라미터(역할, 관심사 등)만 저장하도록 필터링
    const selParams = session && session.selectedParams ? session.selectedParams : ['role', 'interest'];
    
    student.roleTagIds = selParams.includes('role') ? [...W.state.selectedRoles] : [];
    student.interestTagIds = selParams.includes('interest') ? [...W.state.selectedInterests] : [];
    student.customInterest = customInterest;
    student.extroversionScore = selParams.includes('extroversion') ? W.state.extroversionScore : null;
    student.englishLevel = selParams.includes('englishLevel') ? W.state.selectedEnglishLevel : null;
    student.discussionQuestionId = selParams.includes('discussionQuestion') ? W.state.selectedDiscussionQuestion : null;
    student.messageToTeam = messageToTeam;
    
    // 1. 프로필 정보 저장
    await saveStudentProfile(session.code, student);
    
    // 저장 후 선택 상태 초기화
    W.state.selectedRoles = [];
    W.state.selectedInterests = [];
    W.state.selectedEnglishLevel = null;
    W.state.selectedDiscussionQuestion = null;
    
    // 2. 이미 팀 매칭이 끝난 방(published)에 뒤늦게 들어왔는지 판단
    if (session.status === 'published') {
        const myTeam = await assignLateJoiner(session.code, session, student);
        
        if (myTeam) {
            W.state.currentStudent = student;
            // 지연 시간을 주어 서버가 확실히 반영할 시간을 확보합니다.
            await new Promise((r) => setTimeout(r, 350));
            
            const updatedSession = await fetchLatestSession(session.code);
            W.state.currentSession = updatedSession;
            
            const teams = Object.values(updatedSession.teams || {});
            const myTeamFromSession = teams.find(t => t.memberIds && t.memberIds.includes(student.id));
            
            return {
                status: 'published_assigned',
                team: myTeamFromSession || myTeam,
                sessionCode: session.code
            };
        } else {
            return { status: 'published_wait', sessionCode: session.code };
        }
    } else {
        // 아직 팀 매칭 전인 경우
        return { status: 'waiting', sessionCode: session.code };
    }
}

export async function checkSessionStatus(W) {
    // "지금 방 매칭 끝났나요?" 버튼 눌렀을 때 확인하는 로직
    const session = await fetchLatestSession(W.state.currentSession.code);
    W.state.currentSession = session;
    
    if (session && session.status === 'published') {
        const teams = session.teams ? Object.values(session.teams) : [];
        const myTeam = teams.find(t => t.memberIds && t.memberIds.includes(W.state.currentStudent.id));
        return { isPublished: true, myTeam };
    }
    return { isPublished: false };
}

export function listenToSessionUpdates(code, callback) {
    subscribeToSession(code, callback);
}
