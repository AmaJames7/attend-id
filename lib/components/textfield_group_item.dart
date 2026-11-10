import 'package:attend_id/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldGroupItem extends StatelessWidget {
  IconData? icon;
  String title;
  TextEditingController controller;
  TextInputType type;
  TextInputAction actionType;
  bool autofocus;
  TextFieldGroupItem({
    super.key,
    required this.icon,
    required this.title,
    required this.controller,
    required this.type,
    this.actionType = TextInputAction.next,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, child) {
              return Icon(
                icon,
                size: 18,
                color: controller.text.isEmpty
                    ? AppColors.amber
                    : colorScheme.primary,
              );
            },
          ),

          // Icon(
          //   icon,
          //   size: 18,
          //   color: controller.text.isEmpty? AppColors.amber : colorScheme.primary,
          // ),
          const SizedBox(width: 14),

          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: type,
              autofocus: false,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: actionType,

              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),

              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(8, 7, 8, 7),
                isDense: true,
                hintText: title,
                hintStyle: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),

                // Enabled border state (when not focused)
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),

                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(70.0),
                //   borderSide: BorderSide.none,
                // ),

                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(70),
                //   borderSide: const BorderSide(color: AppColors.primaryBrand, width: 1.5),
                // ),
              ),
              // selectionControls: CupertinoTextSelectionControls(),
            ),
          ),
        ],
      ),
    );
  }
}
