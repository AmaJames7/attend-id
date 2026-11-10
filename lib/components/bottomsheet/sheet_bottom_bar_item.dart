import 'dart:ui';

import 'package:flutter/material.dart';

class SheetBottomBarItem extends StatelessWidget {
  final Widget child;
  const SheetBottomBarItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.6),
          ),
          child: child,
        ),
      ),
    );
  }
}
