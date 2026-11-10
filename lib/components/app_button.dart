import 'package:attend_id/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool stretch;
  final Color? foreground;
  final int? count;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.stretch = true,
    this.foreground,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = onPressed == null || isLoading;

    return ElevatedButton(
      style: stretch
          ? TextButton.styleFrom(minimumSize: const Size(double.infinity, 42))
          : null,

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
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 24, color: foreground),
                  const SizedBox(width: 6),
                ],

                if (text.isNotEmpty)
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
