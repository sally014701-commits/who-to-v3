import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../domain/repositories/session_repository.dart';
import '../models/session_model.dart';

part 'firebase_session_repository.g.dart';

class FirebaseSessionRepository implements SessionRepository {
  final FirebaseDatabase _db;

  FirebaseSessionRepository(this._db);

  @override
  Stream<SessionModel?> watchSession(String code) {
    // Note: This assumes code is used as the key or a lookup is done.
    // In many Who2Meet setups, 'sessions/$code' is the path.
    return _db.ref('sessions/$code').onValue.map((event) {
      final value = event.snapshot.value;
      if (value == null) return null;
      try {
        final Map<String, dynamic> data = _convertValue(value);
        return SessionModel.fromJson(data);
      } catch (e) {
        // Log error
        return null;
      }
    });
  }

  @override
  Future<void> createSession(SessionModel session) async {
    await _db.ref('sessions/${session.identity.code}').set(session.toJson());
  }

  @override
  Future<void> updateSession(SessionModel session) async {
    await _db.ref('sessions/${session.identity.code}').update(session.toJson());
  }

  @override
  Future<String?> findSessionIdByCode(String code) async {
    final snapshot = await _db.ref('sessions/$code/identity/id').get();
    return snapshot.value as String?;
  }

  // Helper to handle RTDB's Map<Object?, Object?> conversion
  Map<String, dynamic> _convertValue(Object? value) {
    if (value is Map) {
      return Map<String, dynamic>.from(
        value.map((key, value) => MapEntry(key.toString(), _convertValue(value))),
      );
    } else if (value is List) {
      return value.map((e) => _convertValue(e)).toList();
    }
    return value as dynamic;
  }
}

@riverpod
SessionRepository sessionRepository(SessionRepositoryRef ref) {
  return FirebaseSessionRepository(ref.watch(firebaseDatabaseProvider));
}
