import 'package:attend_id/components/bottomsheet/sheet_body.dart';
import 'package:attend_id/components/bottomsheet/sheet_bottom_bar.dart';
import 'package:attend_id/components/bottomsheet/sheet_header.dart';
import 'package:flutter/material.dart';

class SheetPage extends StatelessWidget {
  final Widget body;
  final Widget? bottomItem;
  const SheetPage({super.key, required this.body, this.bottomItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SheetBody(isBottomBar: bottomItem != null, body: body),

        SheetHeader(),

        if (bottomItem != null) SheetBottomBar(bottomBar: bottomItem!),
      ],
    );
  }
}
