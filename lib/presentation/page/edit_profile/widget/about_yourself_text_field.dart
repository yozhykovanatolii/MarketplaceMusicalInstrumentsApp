import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_description_text_field.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_cubit.dart';

class AboutYourselfTextField extends StatelessWidget {
  final TextEditingController? controller;

  const AboutYourselfTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final aboutError = context.select(
      (EditProfileCubit bloc) => bloc.state.aboutError,
    );
    final counterAbout = context.select(
      (EditProfileCubit bloc) => bloc.state.counterAbout,
    );
    return CommonDescriptionTextField(
      controller: controller,
      height: 200,
      hintText: S.of(context).enterAboutYourself,
      onChanged: (about) {
        context.read<EditProfileCubit>().editAbout(about);
      },
      errorText: aboutError,
      counterText: counterAbout,
    );
  }
}
