import { fetchSession, saveStudent, subscribeToSession } from './studentJoinApi.js';

// Service (비즈니스 로직) 레이어: 학생 정보와 비밀번호를 판단하는 '두뇌' 역할을 합니다.

export async function processStudentJoin(code, name, password, emoji) {
    const W = window.WHO2MEET;
    if (!W) throw new Error("시스템이 아직 준비되지 않았습니다.");

    // 1. 방(Session)이 진짜 있는지 검사
    const session = await fetchSession(code);
    if (!session) {
        throw new Error("SESSION_NOT_FOUND");
    }

    W.state.currentSession = session;
    const students = session.students || {};
    
    // 2. 이미 방에 들어온 적 있는 학생인지 이름으로 찾기
    const existingStudent = Object.values(students).find(s => s.name.toLowerCase() === name.toLowerCase());

    if (existingStudent) {
        // [경우 A] 기존 학생인 경우 -> 비밀번호를 검사합니다.
        if (existingStudent.password !== password) {
            throw new Error("WRONG_PASSWORD");
        }

        // 이모지를 새로 바꿨다면 서버에 업데이트
        if (emoji) {
            existingStudent.emoji = emoji;
            await saveStudent(code, existingStudent);
        }

        W.state.currentStudent = existingStudent;

        // 이 학생이 "프로필 설정(역할/관심사 선택)"까지 다 마친 상태인지 확인
        const hasProfile = existingStudent.roleTagIds && existingStudent.roleTagIds.length > 0;
        
        return {
            status: 'existing',
            hasProfile,
            session,
            student: existingStudent
        };

    } else {
        // [경우 B] 완전 새로운 학생인 경우 -> 새 프로필을 만들고 서버에 저장합니다.
        const newStudent = {
            id: W.utils.generateId(), // 새로운 고유 아이디 발급
            name,
            emoji: emoji || '',
            password,
            roleTagIds: [],
            interestTagIds: [],
            customInterest: '',
            messageToTeam: '',
            teamId: null
        };

        await saveStudent(code, newStudent);
        W.state.currentStudent = newStudent;

        return {
            status: 'new',
            hasProfile: false, // 이제 막 들어왔으므로 프로필이 당연히 없음
            session,
            student: newStudent
        };
    }
}

export function listenToSessionUpdates(code, callback) {
    // 실시간 세션 변경 구독 기능을 외부(컨트롤러)로 전달해 줍니다.
    subscribeToSession(code, callback);
}
