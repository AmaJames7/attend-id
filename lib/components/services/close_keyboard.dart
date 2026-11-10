import 'package:flutter/material.dart';

void closeKeyboard(BuildContext context, Function callback ) async{
  FocusManager.instance.primaryFocus?.unfocus();
  await WidgetsBinding.instance.endOfFrame;
  if (!context.mounted) return;
  callback();
}


Future<bool> closeKeyboardWithResult(BuildContext context, Function callback ) async{
  FocusManager.instance.primaryFocus?.unfocus();
  await WidgetsBinding.instance.endOfFrame;
  if (!context.mounted) return false;
  return callback();
}