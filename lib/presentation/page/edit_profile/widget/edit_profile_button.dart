import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/state/form_status.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_cubit.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formStatus = context.select(
      (EditProfileCubit bloc) => bloc.state.formStatus,
    );
    final child = formStatus == FormStatus.loading
        ? const CommonProgressIndicator(scale: 0.8)
        : Text(
            S.of(context).save,
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
            context.read<EditProfileCubit>().updateProfile();
          },
          color: const Color(0xFF007DFC),
          child: child,
        ),
      ),
    );
  }
}
