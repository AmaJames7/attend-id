import 'package:attend_id/components/bottomsheet/sheet_header_item.dart';
import 'package:flutter/material.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SheetHeaderItem(),
    );
  }
}
