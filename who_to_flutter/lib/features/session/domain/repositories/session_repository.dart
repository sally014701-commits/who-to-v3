import '../models/session_model.dart';

abstract class SessionRepository {
  Stream<SessionModel?> watchSession(String code);
  Future<void> createSession(SessionModel session);
  Future<void> updateSession(SessionModel session);
  Future<String?> findSessionIdByCode(String code);
}
