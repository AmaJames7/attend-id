import 'package:attend_id/components/bottomsheet/adaptive_size.dart';
import 'package:attend_id/components/adaptive_shadow.dart';
import 'package:flutter/material.dart';

class GroupPane extends StatelessWidget {
  final List<Widget> children;
  final double dividerIndent;
  final double bottom;

  const GroupPane({
    super.key,
    required this.children,
    this.dividerIndent = 52,
    this.bottom = 8,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.fromLTRB(
        AdaptiveSize.padding(context),
        8,
        AdaptiveSize.padding(context),
        bottom,
      ),

      decoration: BoxDecoration(boxShadow: getAdaptiveShadow(context)),
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(26),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: theme.colorScheme.surfaceContainer,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(children.length, (index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  children[index],
                  if (index < children.length - 1)
                    Padding(
                      padding: EdgeInsets.only(left: dividerIndent),
                      child: const Divider(),
                    ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
