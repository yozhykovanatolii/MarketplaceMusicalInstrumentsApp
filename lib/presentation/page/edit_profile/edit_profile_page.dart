import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/about_yourself_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/edit_profile_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/edit_profile_user_avatar_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/profile_full_name_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/widget/profile_phone_number_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/login_page.dart';

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
        context.read<EditProfileBloc>().add(
          UserProfileFetchEvent(appState.userModel),
        );
        _fullNameController.text = appState.userModel.fullName;
        _phoneNumberController.text = appState.userModel.phoneNumber;
        _aboutController.text = appState.userModel.about;
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
        title: const Text(
          'Edit profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AppBloc, AppState>(
            listener: (context, state) {
              if (state is UserAuthenticatedState) {
                context.read<EditProfileBloc>().add(
                  UserProfileFetchEvent(state.userModel),
                );
                _fullNameController.text = state.userModel.fullName;
                _phoneNumberController.text = state.userModel.phoneNumber;
                _aboutController.text = state.userModel.about;
              }
              if (state is UserUnauthenticatedState) {
                SnackBarUtil.showSnackBar(
                  context,
                  state.errorMessage,
                  Icons.error,
                  0xFFFFEEEF,
                  0xFFE77282,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            },
          ),
          BlocListener<EditProfileBloc, EditProfileState>(
            listener: (context, state) {
              if (state.formStatus == FormStatus.success) {
                SnackBarUtil.showSnackBar(
                  context,
                  'Success updating profile',
                  Icons.check_circle,
                  0xFFD4FFFE,
                  0xFF009688,
                );
                context.read<AppBloc>().add(AppUserSubscriptionRequested());
              }
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
                  'Full Name',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                ProfileFullNameTextField(
                  controller: _fullNameController,
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                ProfilePhoneNumberTextField(
                  controller: _phoneNumberController,
                ),
                const SizedBox(height: 20),
                Text(
                  'About Yourself',
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                    fontWeight: FontWeight.w600,
                  ),
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
