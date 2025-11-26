import 'package:flutter/material.dart';

class ModalSheetHelper {
  static void showModalSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (_) => widget,
    );
  }
}
