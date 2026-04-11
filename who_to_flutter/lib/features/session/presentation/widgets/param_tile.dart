import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ParamTile extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onToggle;
  final Widget? content;

  const ParamTile({
    super.key,
    required this.title,
    required this.isActive,
    required this.onToggle,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        border: Border.all(
          color: isActive ? AppColors.accent : AppColors.border,
          width: isActive ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.sectionTitle.copyWith(
                    color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                ),
              ),
              Switch.adaptive(
                value: isActive,
                onChanged: (_) => onToggle(),
                activeColor: AppColors.accent,
              ),
            ],
          ),
          if (content != null) ...[
            const SizedBox(height: 12),
            Expanded(child: content!),
          ],
        ],
      ),
    );
  }
}
