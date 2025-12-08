import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/helper/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/about_yourself_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/edit_profile_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/edit_profile_user_avatar_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/profile_full_name_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/profile_phone_number_text_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _aboutController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appState = context.read<AppBloc>().state;
      if (appState is UserAuthenticatedState) {
        context.read<EditProfileCubit>().fetchUserProfile(appState.user);
        _fullNameController.text = appState.user.fullName;
        _phoneNumberController.text = appState.user.phoneNumber;
        _aboutController.text = appState.user.about;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).editProfile,
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AppBloc, AppState>(
            listener: (context, state) {
              if (state is UserAuthenticatedState) {
                context.read<EditProfileCubit>().fetchUserProfile(state.user);
                _fullNameController.text = state.user.fullName;
                _phoneNumberController.text = state.user.phoneNumber;
                _aboutController.text = state.user.about;
              }
              if (state is UserUnauthenticatedState) {
                UiHelper.showSnackBar(
                  context: context,
                  message: state.errorMessage,
                  isErrorSnackBar: true,
                );
                context.go(AppRoutes.loginPage);
              }
            },
          ),
          BlocListener<EditProfileCubit, EditProfileState>(
            listener: (context, state) {
              if (state.formStatus == FormStatus.success) {
                UiHelper.showSnackBar(
                  context: context,
                  message: S.of(context).successUpdatingProfile,
                );
                context.read<AppBloc>().add(AppUserSubscriptionRequested());
              }
              if (state.errorMessage.isNotEmpty) {
                UiHelper.showSnackBar(
                  context: context,
                  message: state.errorMessage,
                  isErrorSnackBar: true,
                );
              }
            },
          ),
        ],
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EditProfileUserAvatarSection(),
                const SizedBox(height: 20),
                Text(
                  S.of(context).fullName,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 10),
                ProfileFullNameTextField(
                  controller: _fullNameController,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).phoneNumber,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 10),
                ProfilePhoneNumberTextField(
                  controller: _phoneNumberController,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).aboutYourself,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 10),
                AboutYourselfTextField(
                  controller: _aboutController,
                ),
                const EditProfileButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
