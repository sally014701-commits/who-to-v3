import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/session_model.dart';
import '../../data/repositories/firebase_session_repository.dart';

part 'session_provider.g.dart';

@riverpod
class SessionNotifier extends _$SessionNotifier {
  @override
  Stream<SessionModel?> build(String code) {
    return ref.watch(sessionRepositoryProvider).watchSession(code);
  }

  Future<void> joinSession(String code) async {
    // Basic validation or additional logic before joining
    state = const AsyncValue.loading();
    try {
      final session = await ref.read(sessionRepositoryProvider).watchSession(code).first;
      if (session != null) {
        // Success
      } else {
        state = AsyncValue.error('Session not found', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
