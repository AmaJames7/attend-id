import 'package:attend_id/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonDark extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final Color? foreground;
  final Color background;

  const AppButtonDark({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.foreground,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = onPressed == null || isLoading;

    return ElevatedButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(268, 42),
        backgroundColor: background,
      ),

      onPressed: isButtonDisabled ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 24, color: foreground),
                  const SizedBox(width: 6),
                ],
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 0.2,
                    color: foreground,
                  ),
                ),
              ],
            ),
    );
  }
}
