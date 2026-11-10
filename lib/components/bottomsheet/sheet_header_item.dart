import 'package:attend_id/components/bottomsheet/drag_indicator.dart';
import 'package:flutter/material.dart';

class SheetHeaderItem extends StatelessWidget {
  // final Widget child;
  const SheetHeaderItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [const AppDragIndicator()]);
  }
}
