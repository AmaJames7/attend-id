import 'dart:ui';

import 'package:flutter/material.dart';

class AppDragIndicator extends StatelessWidget {
  const AppDragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.only(
        topLeft: Radius.circular(26),
        topRight: Radius.circular(26),
      ),
      child: BackdropFilter.grouped(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.5),
          ),
          child: Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
