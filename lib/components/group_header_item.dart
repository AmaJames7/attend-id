import 'package:flutter/material.dart';

class ListGroupItem extends StatelessWidget {
  IconData icon;
  String title;
  Color? color;
  Widget? trailing;
  bool isChevron;
  VoidCallback onTap;
  ListGroupItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.color,
    this.isChevron = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // 1. Uses the primary color designated by the active theme's ColorScheme
            Icon(icon, size: 22, color: color ?? colorScheme.primary),
            const SizedBox(width: 14),

            // 2. Uses the standardized body text style from your typography configuration
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(color: color),
              ),
            ),

            trailing ?? SizedBox(),
            const SizedBox(width: 4),

            // 3. Replaces hardcoded opacities with onSurface variant for structural UI hints
            if (isChevron)
              Icon(
                Icons.chevron_right,
                size: 20,
                color: color ?? colorScheme.onSurface.withValues(alpha: 0.3),
              ),
          ],
        ),
      ),
    );
  }
}
