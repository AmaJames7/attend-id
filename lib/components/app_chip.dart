import 'package:attend_id/components/adaptive_shadow.dart';
import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  final String label;
  final IconData? iconData;
  final Color? color;
  final double? iconSize, textSize, textSpacing;
  const AppChip({
    super.key,
    this.color,
    this.iconSize = 12,
    this.textSize = 11,
    this.textSpacing,
    required this.label,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          boxShadow: getAdaptiveShadow(context),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            if (iconData != null)
              Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(iconData, size: iconSize, color: color),
              ),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: textSize,
                color: color,
                letterSpacing: textSpacing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
