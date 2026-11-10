import 'package:attend_id/components/bottomsheet/adaptive_size.dart';
import 'package:attend_id/components/bottomsheet/sheet_bottom_bar_item.dart';
import 'package:flutter/material.dart';

class SheetBottomBar extends StatelessWidget {
  final Widget bottomBar;
  const SheetBottomBar({super.key, required this.bottomBar});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SafeArea(
          top: false,
          child: SheetBottomBarItem(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AdaptiveSize.padding(context) + 8,
                8,
                AdaptiveSize.padding(context) + 8,
                20,
              ),
              child: bottomBar,
            ),
          ),
        ),
      ),
    );
  }
}
