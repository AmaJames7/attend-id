import 'package:flutter/material.dart';

List<BoxShadow> getAdaptiveShadow(BuildContext context, {bool isDeep = false}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return [
    isDeep
        ? BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.black.withValues(alpha: 0.3),
            blurRadius: isDark ? 34.0 : 30.0,
            spreadRadius: isDark ? -1.0 : 0.0,
            offset: Offset(0, 10),
          )
        : BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.black.withValues(alpha: 0.03),
            blurRadius: isDark ? 24.0 : 20.0,
            spreadRadius: isDark ? -1.0 : 0.0,
            offset: Offset(0, 10),
          ),
  ];
}
