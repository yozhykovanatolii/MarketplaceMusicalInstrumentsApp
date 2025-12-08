import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';

class SettingListTile extends StatelessWidget {
  final String text;
  final IconData leadingIcon;
  final Widget trailing;

  const SettingListTile({
    super.key,
    required this.text,
    required this.leadingIcon,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        size: 36,
        leadingIcon,
        color: const Color(AppColors.kBlue),
      ),
      title: Text(text),
      trailing: trailing,
    );
  }
}
