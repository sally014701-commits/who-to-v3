import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/parts/matching_config.dart';
import '../../data/models/parts/session_identity.dart';
import '../../data/models/parts/instructor_profile.dart';
import '../../data/models/parts/session_state.dart';
import '../../data/models/session_model.dart';
import '../../data/repositories/firebase_session_repository.dart';
import '../../../shared/data/models/tag_model.dart';
import '../../../shared/data/models/question_model.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/uuid_utils.dart'; // Assume exists or I'll create it

part 'create_session_controller.freezed.dart';
part 'create_session_controller.g.dart';

@freezed
class CreateSessionState with _$CreateSessionState {
  const factory CreateSessionState({
    @Default('') String sessionName,
    @Default('') String instructorName,
    @Default('') String instructorEmoji,
    @Default('') String instructorPassword,
    @Default(4) int teamSize,
    @Default(['role', 'interest']) List<String> selectedParams,
    @Default({'role': 50, 'interest': 50}) Map<String, int> weights,
    @Default([]) List<TagModel> roleTags,
    @Default([]) List<TagModel> interestTags,
    @Default([]) List<QuestionModel> discussionQuestions,
    @Default(false) bool isParamLocked,
    @Default(null) String? error,
    @Default(false) bool isSubmitting,
  }) = _CreateSessionState;
}

@riverpod
class CreateSessionController extends _$CreateSessionController {
  @override
  CreateSessionState build() {
    return CreateSessionState(
      roleTags: List.from(AppConstants.defaultRoleTags),
      interestTags: List.from(AppConstants.defaultInterestTags),
    );
  }

  void updateSessionName(String name) => state = state.copyWith(sessionName: name);
  void updateInstructorName(String name) => state = state.copyWith(instructorName: name);
  void updateInstructorEmoji(String emoji) => state = state.copyWith(instructorEmoji: emoji);
  void updateInstructorPassword(String pwd) => state = state.copyWith(instructorPassword: pwd);
  void updateTeamSize(int size) => state = state.copyWith(teamSize: size);

  void toggleParam(String paramId) {
    if (state.isParamLocked) return;
    
    final current = List<String>.from(state.selectedParams);
    if (current.contains(paramId)) {
      current.remove(paramId);
    } else {
      current.add(paramId);
    }
    state = state.copyWith(selectedParams: current);
  }

  void lockParams() {
    if (state.selectedParams.length < 2) {
      state = state.copyWith(error: 'Select at least 2 parameters.');
      return;
    }
    
    // Initial equal distribution
    final n = state.selectedParams.length;
    final defaultVal = 100 ~/ n;
    final Map<String, int> initialWeights = {};
    for (var i = 0; i < n; i++) {
      initialWeights[state.selectedParams[i]] = defaultVal;
    }
    // Handle remainder
    final remainder = 100 - (defaultVal * n);
    for (var i = 0; i < remainder; i++) {
        initialWeights[state.selectedParams[i]] = (initialWeights[state.selectedParams[i]] ?? 0) + 1;
    }

    state = state.copyWith(
      isParamLocked: true,
      weights: initialWeights,
      error: null,
    );
  }

  void updateWeight(String draggedId, int newVal) {
    final others = state.selectedParams.where((id) => id != draggedId).toList();
    if (others.isEmpty) return;

    final draggedVal = newVal.clamp(0, 100);
    final remainingSum = 100 - draggedVal;
    
    final Map<String, int> newWeights = Map.from(state.weights);
    newWeights[draggedId] = draggedVal;

    final currentOthersSum = others.fold<int>(0, (sum, id) => sum + (state.weights[id] ?? 0));

    if (currentOthersSum > 0) {
      int allocated = 0;
      for (var i = 0; i < others.length; i++) {
        final id = others[i];
        final isLast = i == others.length - 1;
        final v = isLast 
            ? remainingSum - allocated 
            : (remainingSum * (state.weights[id] ?? 0) / currentOthersSum).round();
        final clamped = v.clamp(0, 100);
        newWeights[id] = clamped;
        allocated += clamped;
      }
    } else {
      final per = remainingSum ~/ others.length;
      final rem = remainingSum % others.length;
      for (var i = 0; i < others.length; i++) {
        newWeights[others[i]] = per + (i < rem ? 1 : 0);
      }
    }

    state = state.copyWith(weights: newWeights);
  }

  // Tag/Question Management
  void addRoleTag(String name, String emoji) {
    state = state.copyWith(roleTags: [...state.roleTags, TagModel(id: name.toLowerCase().replaceAll(' ', '-'), name: name, emoji: emoji)]);
  }

  void updateRoleTag(int index, String? name, String? emoji) {
    final list = List<TagModel>.from(state.roleTags);
    final current = list[index];
    list[index] = current.copyWith(
      name: name ?? current.name,
      emoji: emoji ?? current.emoji,
      id: name != null ? name.toLowerCase().replaceAll(' ', '-') : current.id,
    );
    state = state.copyWith(roleTags: list);
  }

  void removeRoleTag(int index) {
    final list = List<TagModel>.from(state.roleTags);
    list.removeAt(index);
    state = state.copyWith(roleTags: list);
  }

  void addInterestTag(String name, String emoji) {
    state = state.copyWith(interestTags: [...state.interestTags, TagModel(id: name.toLowerCase().replaceAll(' ', '-'), name: name, emoji: emoji)]);
  }

  void updateInterestTag(int index, String? name, String? emoji) {
    final list = List<TagModel>.from(state.interestTags);
    final current = list[index];
    list[index] = current.copyWith(
      name: name ?? current.name,
      emoji: emoji ?? current.emoji,
      id: name != null ? name.toLowerCase().replaceAll(' ', '-') : current.id,
    );
    state = state.copyWith(interestTags: list);
  }

  void removeInterestTag(int index) {
    final list = List<TagModel>.from(state.interestTags);
    list.removeAt(index);
    state = state.copyWith(interestTags: list);
  }

  void addQuestion(String text) {
    state = state.copyWith(discussionQuestions: [...state.discussionQuestions, QuestionModel(id: 'q-${state.discussionQuestions.length + 1}', text: text)]);
  }

  void updateQuestion(int index, String text) {
    final list = List<QuestionModel>.from(state.discussionQuestions);
    list[index] = list[index].copyWith(text: text);
    state = state.copyWith(discussionQuestions: list);
  }

  void removeQuestion(int index) {
    final list = List<QuestionModel>.from(state.discussionQuestions);
    list.removeAt(index);
    state = state.copyWith(discussionQuestions: list);
  }

  Future<String?> createSession() async {
    if (state.sessionName.isEmpty || state.instructorName.isEmpty || state.instructorPassword.isEmpty) {
      state = state.copyWith(error: 'Please fill all fields.');
      return null;
    }

    state = state.copyWith(isSubmitting: true, error: null);

    final code = _generateSessionCode();
    final newSession = SessionModel(
      identity: SessionIdentity(
        id: UuidUtils.generate(),
        code: code,
        name: state.sessionName,
      ),
      instructor: InstructorProfile(
        name: state.instructorName,
        emoji: state.instructorEmoji,
        password: state.instructorPassword,
      ),
      config: MatchingConfig(
        teamSize: state.teamSize,
        selectedParams: state.selectedParams,
        weights: state.weights.map((key, value) => MapEntry(key, value)),
      ),
      resources: SessionResources(
        roleTags: state.roleTags,
        interestTags: state.interestTags,
        discussionQuestions: state.discussionQuestions,
      ),
      state: const SessionState(status: 'open'),
    );

    try {
      await ref.read(sessionRepositoryProvider).createSession(newSession);
      state = state.copyWith(isSubmitting: false);
      return code;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());
      return null;
    }
  }

  String _generateSessionCode() {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final rnd = DateTime.now().millisecondsSinceEpoch;
    return List.generate(6, (index) => chars[(rnd + index) % chars.length]).join();
  }
}
