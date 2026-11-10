import 'package:attend_id/components/bottomsheet/adaptive_size.dart';
import 'package:flutter/material.dart';

class GroupHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool? zeroPadding;
  final bool isHorizontal;
  final Color? color;
  const GroupHeader({
    super.key,
    this.isHorizontal = false,
    this.color,
    required this.title,
    this.subtitle,
    this.zeroPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: AdaptiveSize.padding(context) + 16,
        top: zeroPadding == null || zeroPadding == false ? 24 : 0,
        right: AdaptiveSize.padding(context) + 16,
      ),
      child: isHorizontal == true
          ? Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelSmall?.copyWith(color: color),
                ),

                subtitle != null
                    ? Text(
                        subtitle!,
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 18,
                          color: color,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.labelSmall?.copyWith(color: color),
                  ),
                ),
                subtitle != null
                    ? Text(
                        subtitle!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: color,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
    );
  }
}
