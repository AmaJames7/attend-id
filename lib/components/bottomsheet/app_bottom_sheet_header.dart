import 'package:attend_id/components/app_avatar.dart';
import 'package:attend_id/components/bottomsheet/adaptive_size.dart';
import 'package:flutter/material.dart';

class AppBottomSheetHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final AppAvatar? avatar;
  final double gap;
  final double bottomSpacing;

  const AppBottomSheetHeader({
    super.key,
    required this.title,
    this.bottomSpacing = 20,
    this.gap = 2,
    this.subtitle,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AdaptiveSize.padding(context) + 5,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: gap),
              child: avatar ?? SizedBox(),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayMedium?.copyWith(fontSize: 20),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium?.copyWith(fontSize: 13),
              ),
            SizedBox(height: bottomSpacing),
          ],
        ),
      ),
    );
  }
}
