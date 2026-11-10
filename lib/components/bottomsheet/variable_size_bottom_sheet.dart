import 'package:attend_id/components/services/close_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

Future<bool> showVariableSizedSheet(BuildContext context, {Widget? sheetItem}) {
  return closeKeyboardWithResult(context, () {
    return onShowVariableSizedSheet(context, sheetItem: sheetItem);
  });
}

Future<bool> onShowVariableSizedSheet(
  BuildContext context, {
  Widget? sheetItem,
}) async {
  final result = await showModalSheet<bool>(
    context: context,
    barrierDismissible: true,
    swipeDismissible: true,
    barrierColor: Colors.black54,

    builder: (sheetContext) {
      final colorScheme = Theme.of(sheetContext).colorScheme;
      final mediaQuery = MediaQuery.of(sheetContext);
      const sheetRadius = Radius.circular(26);
      final maxSheetHeight = mediaQuery.size.height - mediaQuery.padding.top;

      return Sheet(
        physics: const BouncingSheetPhysics(),

        scrollConfiguration: const SheetScrollConfiguration(
          scrollSyncMode: SheetScrollHandlingBehavior.onlyFromTop,
        ),

        decoration: MaterialSheetDecoration(
          size: SheetSize.fit,

          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: sheetRadius),
        ),

        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: sheetRadius),
          child: SheetContentScaffold(
            backgroundColor: colorScheme.surface,
            body: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxSheetHeight),
              child: sheetItem,
            ),
          ),
        ),
      );
    },
  );

  return result ?? false;
}
