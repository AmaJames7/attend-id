import 'package:attend_id/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final int? count;
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool stretch, isDanger;
  final bool isLoading;
  final double height;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.stretch = false,
    this.isDanger = false,
    this.count,
    this.height = 42,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = onPressed == null || isLoading;

    return TextButton(
      style: stretch
          ? TextButton.styleFrom(minimumSize: Size(double.infinity, height))
          : TextButton.styleFrom(minimumSize: Size(48, height)),

      onPressed: isButtonDisabled ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isDanger ? AppColors.amber : AppColors.primaryBrand,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 20,
                    color: isDanger ? AppColors.amber : null,
                  ),
                  if (text.isNotEmpty) const SizedBox(width: 6),
                ],

                Text(
                  text,
                  style: TextStyle(
                    fontWeight: isDanger ? FontWeight.bold : FontWeight.w500,
                    color: isDanger ? AppColors.amber : null,
                    fontSize: 14,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
    );
  }
}
