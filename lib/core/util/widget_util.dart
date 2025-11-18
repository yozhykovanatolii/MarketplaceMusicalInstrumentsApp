import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/snack_bar_body.dart';

class WidgetUtil {
  static void showSnackBar(
    BuildContext context,
    String message,
    IconData iconData,
    int backgroundColor,
    int color,
  ) {
    var snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: SnackBarBody(
        backgroundColor: backgroundColor,
        color: color,
        message: message,
        iconData: iconData,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
