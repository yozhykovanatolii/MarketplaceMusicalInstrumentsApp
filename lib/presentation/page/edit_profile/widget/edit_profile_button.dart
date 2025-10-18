import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formStatus = context.select(
      (EditProfileBloc bloc) => bloc.state.formStatus,
    );
    final child = formStatus == FormStatus.loading
        ? const CommonProgressIndicator(scale: 0.8)
        : Text(
            'Save',
            style: TextStyle(
              fontSize: MediaQuery.textScalerOf(context).scale(18),
              color: Colors.white,
            ),
          );
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: CommonButton(
          width: MediaQuery.of(context).size.width,
          onPressed: () {
            context.read<EditProfileBloc>().add(
              ProfileUpdateEvent(),
            );
          },
          color: const Color(0xFF007DFC),
          child: child,
        ),
      ),
    );
  }
}
