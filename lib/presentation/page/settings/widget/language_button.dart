import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/widget_util.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/settings/settings_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/languages/languages_page.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.select(
      (SettingsCubit cubit) => cubit.state.languageCode == 'en',
    );
    return GestureDetector(
      onTap: () => WidgetUtil.showModalSheet(
        context,
        const LanguagesPage(),
      ),
      child: Text(isEnglish ? 'English' : 'Українська'),
    );
  }
}
