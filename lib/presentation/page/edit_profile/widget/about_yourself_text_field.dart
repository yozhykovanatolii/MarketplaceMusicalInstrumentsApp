import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';

class AboutYourselfTextField extends StatelessWidget {
  final TextEditingController? controller;

  const AboutYourselfTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final aboutError = context.select(
      (EditProfileBloc bloc) => bloc.state.aboutError,
    );
    final counterAbout = context.select(
      (EditProfileBloc bloc) => bloc.state.counterAbout,
    );
    return SizedBox(
      height: 200,
      child: TextField(
        controller: controller,
        onChanged: (about) {
          context.read<EditProfileBloc>().add(
            ProfileAboutChangeEvent(about),
          );
        },
        maxLines: null,
        minLines: 5,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          hintText: S.of(context).enterAboutYourself,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(10),
          errorText: aboutError,
          counterText: counterAbout,
        ),
      ),
    );
  }
}
