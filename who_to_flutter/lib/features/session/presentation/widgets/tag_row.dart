import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TagRow extends StatelessWidget {
  final String emoji;
  final String name;
  final VoidCallback onRemove;
  final Function(String) onEmojiChanged;
  final Function(String) onNameChanged;

  const TagRow({
    super.key,
    required this.emoji,
    required this.name,
    required this.onRemove,
    required this.onEmojiChanged,
    required this.onNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: TextField(
              decoration: const InputDecoration(
                hintText: '💻',
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              controller: TextEditingController(text: emoji)..selection = TextSelection.collapsed(offset: emoji.length),
              onChanged: onEmojiChanged,
              maxLength: 2,
              textAlign: TextAlign.center,
              buildCounter: (context, {required currentLength, isFocused, maxLength}) => null,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Role name',
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              controller: TextEditingController(text: name)..selection = TextSelection.collapsed(offset: name.length),
              onChanged: onNameChanged,
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
