import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/settings/widget/language_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/settings/widget/setting_list_tile.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/settings/widget/theme_switch.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
        ),
      ),
      body: ListView(
        children: [
          SettingListTile(
            leadingIcon: Iconsax.sun_1,
            text: S.of(context).darkMode,
            trailing: const ThemeSwitch(),
          ),
          SettingListTile(
            leadingIcon: Iconsax.language_circle,
            text: S.of(context).language,
            trailing: const LanguageButton(),
          ),
        ],
      ),
    );
  }
}
