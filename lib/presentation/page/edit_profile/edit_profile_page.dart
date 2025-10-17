import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/about_yourself_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/edit_profile_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/edit_profile_user_avatar_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/profile_full_name_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/profile_phone_number_text_field.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            SnackBarUtil.showSnackBar(
              context,
              state.errorMessage,
              Icons.error,
              0xFFFFEEEF,
              0xFFE77282,
            );
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EditProfileUserAvatarSection(),
                const SizedBox(height: 20),
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const ProfileFullNameTextField(),
                const SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const ProfilePhoneNumberTextField(),
                const SizedBox(height: 20),
                Text(
                  'About Yourself',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const AboutYourselfTextField(),
                const EditProfileButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
