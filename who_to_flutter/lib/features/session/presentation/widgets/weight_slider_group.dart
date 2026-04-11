import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class WeightSliderGroup extends StatelessWidget {
  final List<String> selectedParams;
  final Map<String, int> weights;
  final Function(String, int) onWeightChanged;

  const WeightSliderGroup({
    super.key,
    required this.selectedParams,
    required this.weights,
    required this.onWeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: selectedParams.map((id) {
        final weight = weights[id] ?? 0;
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _getParamIcon(id),
                      const SizedBox(width: 8),
                      Text(
                        _getParamLabel(id),
                        style: AppTextStyles.sectionTitle,
                      ),
                    ],
                  ),
                  Text(
                    '$weight%',
                    style: AppTextStyles.sectionTitle.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Slider.adaptive(
                value: weight.toDouble(),
                min: 0,
                max: 100,
                divisions: 100,
                activeColor: AppColors.accent,
                onChanged: (val) => onWeightChanged(id, val.toInt()),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _getParamIcon(String id) {
    switch (id) {
      case 'role': return const Icon(Icons.work_outline, size: 20);
      case 'interest': return const Icon(Icons.ads_click, size: 20);
      case 'extroversion': return const Icon(Icons.psychology_outlined, size: 20);
      case 'englishLevel': return const Icon(Icons.translate, size: 20);
      case 'discussionQuestion': return const Icon(Icons.question_answer_outlined, size: 20);
      default: return const Icon(Icons.settings, size: 20);
    }
  }

  String _getParamLabel(String id) {
    switch (id) {
      case 'role': return 'Role Diversity';
      case 'interest': return 'Interest Similarity';
      case 'extroversion': return 'Extroversion Balance';
      case 'englishLevel': return 'English Level Similarity';
      case 'discussionQuestion': return 'Discussion Question Match';
      default: return id;
    }
  }
}
