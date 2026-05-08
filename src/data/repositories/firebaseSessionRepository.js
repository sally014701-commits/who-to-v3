/**
 * Data Repository (Infrastructure-adapter for Firebase).
 *
 * This repository adapts the legacy `js/firebase.js` module API into
 * the clean-architecture repository interface needed by services/usecases.
 *
 * Note: No DOM access here.
 */

export function createFirebaseSessionRepository(firebase) {
    if (!firebase) throw new Error('firebase is required');

    return {
        async getSessionByCode(code) {
            return firebase.getSessionByCode(code);
        },

        async saveTeamsInDB(code, teamsObj) {
            return firebase.saveTeamsInDB(code, teamsObj);
        }
    };
}

