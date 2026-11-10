import 'package:attend_id/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final double size;

  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = 16,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: backgroundColor != null
            ? WidgetStatePropertyAll(backgroundColor)
            : null,
        foregroundColor: backgroundColor != null
            ? WidgetStatePropertyAll(AppColors.darkTextPrimary)
            : null,
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      iconSize: size,
      onPressed: onPressed,
      icon: Icon(icon, color: color),
    );
  }
}
