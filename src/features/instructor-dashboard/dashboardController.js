import { refreshDashboard, runMatchingProcess } from './dashboardService.js';

function bindEvent(id, event, handler) {
    const el = document.getElementById(id);
    if (el) el.addEventListener(event, handler);
    return el;
}

// Controller (UI) 레이어: 매칭 버튼 클릭을 감지하고, 서비스의 결과에 따라 화면을 그립니다.
export function initDashboardController(W) {
    const { render, nav } = W;

    // 1. [새로고침] 버튼 클릭
    bindEvent('btn-refresh', 'click', async () => {
        try {
            await refreshDashboard(W);
            render.renderDashboard();
        } catch (err) {
            console.error(err);
        }
    });

    // 2. [매칭 실행] 버튼 클릭 (가장 핵심 이벤트)
    bindEvent('btn-run-matching', 'click', async () => {
        try {
            // 서비스 계층에 매칭 실행을 의뢰합니다.
            const result = await runMatchingProcess(W);
            
            // 서비스 계층이 반환한 팀(teams) 데이터를 바탕으로 화면(UI)을 조작합니다.
            render.renderDashboard();
            document.getElementById('results-title').textContent = 'All Teams';
            
            const backBtn = document.getElementById('btn-back-dashboard');
            if (backBtn) backBtn.style.display = 'block';
            
            // 화면에 완성된 팀 그려주기
            render.renderTeams(result.teams, true);
            
            // 결과 화면으로 이동!
            nav.showScreen('results');
            
        } catch (err) {
            // 서비스 계층에서 발생한 예외(에러)를 화면에 알림창으로 띄워줍니다.
            if (err.message === "NO_STUDENTS") {
                alert('No students have submitted their profiles yet!');
            } else {
                alert('Error running matching: ' + err.message);
            }
        }
    });

    // 3. 매칭 결과창에서 [대시보드로 돌아가기] 버튼 클릭
    bindEvent('btn-back-dashboard', 'click', () => {
        nav.showScreen('instructor-dashboard');
    });
}
