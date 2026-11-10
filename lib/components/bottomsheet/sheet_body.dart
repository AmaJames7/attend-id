import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class SheetBody extends StatefulWidget {
  final bool isBottomBar;
  final Widget body;
  const SheetBody({super.key, required this.isBottomBar, required this.body});

  @override
  State<SheetBody> createState() => _SheetBodyState();
}

class _SheetBodyState extends State<SheetBody> {
  final scrollController = SheetScrollController();

  @override
  Widget build(BuildContext context) {
    return SheetScrollable(
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,

        padding: EdgeInsets.only(
          top: 40,
          bottom: widget.isBottomBar
              ? 85 + MediaQuery.viewInsetsOf(context).bottom
              : MediaQuery.viewInsetsOf(context).bottom + 20,
        ),

        child: Form(child: widget.body),
      ),
    );
  }
}
