import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../providers/create_session_controller.dart';
import '../widgets/param_tile.dart';
import '../widgets/tag_row.dart';
import '../widgets/question_row.dart';
import '../widgets/weight_slider_group.dart';

class CreateSessionPage extends ConsumerWidget {
  const CreateSessionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createSessionControllerProvider);
    final controller = ref.read(createSessionControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Session'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle('Basic Information'),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildTextField(
                      label: 'Session Name',
                      hint: 'e.g., CS101 Spring 2024',
                      onChanged: controller.updateSessionName,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      label: 'Your Name (Instructor)',
                      hint: 'Enter your name',
                      onChanged: controller.updateInstructorName,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildTextField(
                            label: 'Emoji (optional)',
                            hint: '👩‍🏫',
                            onChanged: controller.updateInstructorEmoji,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 3,
                          child: _buildTextField(
                            label: 'Team Size',
                            hint: '4',
                            keyboardType: TextInputType.number,
                            onChanged: (val) => controller.updateTeamSize(int.tryParse(val) ?? 4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      label: 'Dashboard Password',
                      hint: 'Create a password',
                      obscureText: true,
                      onChanged: controller.updateInstructorPassword,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            _buildSectionTitle('Matching Parameters'),
            const Text(
              'Select at least 2 factors to balance your teams.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRoleParamTile(state, controller),
                  _buildInterestParamTile(state, controller),
                  _buildExtroversionParamTile(state, controller),
                  _buildEnglishParamTile(state, controller),
                  _buildQuestionParamTile(state, controller),
                ],
              ),
            ),
            
            if (state.isParamLocked) ...[
              const SizedBox(height: 40),
              _buildSectionTitle('Matching Weights'),
              const Text(
                'Adjust how much each factor matters (Total must be 100%)',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 24),
              WeightSliderGroup(
                selectedParams: state.selectedParams,
                weights: state.weights,
                onWeightChanged: controller.updateWeight,
              ),
            ] else ...[
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: state.selectedParams.length >= 2 ? controller.lockParams : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bgSecondary,
                  foregroundColor: AppColors.textPrimary,
                ),
                child: const Text('Next: Configure Weights'),
              ),
            ],
            
            if (state.error != null) ...[
              const SizedBox(height: 16),
              Text(
                state.error!,
                style: const TextStyle(color: Colors.redAccent, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ],
            
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: state.isSubmitting ? null : () async {
                final code = await controller.createSession();
                if (code != null && context.mounted) {
                  // Navigate to Dashboard or Success Page
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Session Created! Code: $code')),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: state.isSubmitting
                  ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('Create Session'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: AppTextStyles.heroSubtitle.copyWith(fontSize: 18, color: AppColors.textPrimary)),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required Function(String) onChanged,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textSecondary)),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }

  // --- Specific Parameter Tile Content ---

  Widget _buildRoleParamTile(CreateSessionState state, CreateSessionController controller) {
    final isActive = state.selectedParams.contains('role');
    return ParamTile(
      title: 'Role Diversity',
      isActive: isActive,
      onToggle: () => controller.toggleParam('role'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ...state.roleTags.asMap().entries.map((e) => TagRow(
              emoji: e.value.emoji,
              name: e.value.name,
              onRemove: () => controller.removeRoleTag(e.key),
              onEmojiChanged: (v) => controller.updateRoleTag(e.key, null, v),
              onNameChanged: (v) => controller.updateRoleTag(e.key, v, null),
            )),
            TextButton(
              onPressed: () => controller.addRoleTag('New Role', '💼'),
              child: const Text('+ Add Role', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterestParamTile(CreateSessionState state, CreateSessionController controller) {
    final isActive = state.selectedParams.contains('interest');
    return ParamTile(
      title: 'Interest Similarity',
      isActive: isActive,
      onToggle: () => controller.toggleParam('interest'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ...state.interestTags.asMap().entries.map((e) => TagRow(
              emoji: e.value.emoji,
              name: e.value.name,
              onRemove: () => controller.removeInterestTag(e.key),
              onEmojiChanged: (v) => controller.updateInterestTag(e.key, null, v),
              onNameChanged: (v) => controller.updateInterestTag(e.key, v, null),
            )),
            TextButton(
              onPressed: () => controller.addInterestTag('New Interest', '🎯'),
              child: const Text('+ Add Interest', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExtroversionParamTile(CreateSessionState state, CreateSessionController controller) {
    final isActive = state.selectedParams.contains('extroversion');
    return ParamTile(
      title: 'Intro/Extro Balance',
      isActive: isActive,
      onToggle: () => controller.toggleParam('extroversion'),
      content: const Center(child: Text('Ensures mixed personality types in each team.', style: TextStyle(fontSize: 12, color: AppColors.textSecondary))),
    );
  }

  Widget _buildEnglishParamTile(CreateSessionState state, CreateSessionController controller) {
    final isActive = state.selectedParams.contains('englishLevel');
    return ParamTile(
      title: 'English Level',
      isActive: isActive,
      onToggle: () => controller.toggleParam('englishLevel'),
      content: const Center(child: Text('Balances language proficiency across teams.', style: TextStyle(fontSize: 12, color: AppColors.textSecondary))),
    );
  }

  Widget _buildQuestionParamTile(CreateSessionState state, CreateSessionController controller) {
    final isActive = state.selectedParams.contains('discussionQuestion');
    return ParamTile(
      title: 'Discussion Match',
      isActive: isActive,
      onToggle: () => controller.toggleParam('discussionQuestion'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ...state.discussionQuestions.asMap().entries.map((e) => QuestionRow(
              text: e.value.text,
              onRemove: () => controller.removeQuestion(e.key),
              onChanged: (v) => controller.updateQuestion(e.key, v),
            )),
            TextButton(
              onPressed: () => controller.addQuestion('New Question'),
              child: const Text('+ Add Question', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
