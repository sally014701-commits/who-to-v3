import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class QuestionRow extends StatelessWidget {
  final String text;
  final VoidCallback onRemove;
  final Function(String) onChanged;

  const QuestionRow({
    super.key,
    required this.text,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter discussion question...',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              controller: TextEditingController(text: text)..selection = TextSelection.collapsed(offset: text.length),
              onChanged: onChanged,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.close, size: 20),
            onPressed: onRemove,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
