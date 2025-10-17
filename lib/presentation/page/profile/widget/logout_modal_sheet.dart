import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/login_page.dart';

class LogoutModalSheet extends StatelessWidget {
  const LogoutModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.693,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              'Logout',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              'Are you sure you want to log out?',
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(20),
                fontWeight: FontWeight.w500,
              ),
            ),
            const _LogoutActionButtonsSection(),
          ],
        ),
      ),
    );
  }
}

class _LogoutActionButtonsSection extends StatelessWidget {
  const _LogoutActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: Row(
          spacing: 20,
          children: [
            Flexible(
              child: _LogoutActionButton(
                text: 'Cancel',
                onPressed: () => Navigator.pop(context),
                isLogOutButton: false,
              ),
            ),
            Flexible(
              child: _LogoutActionButton(
                text: 'Yes, Logout',
                onPressed: () {
                  context.read<EditProfileBloc>().add(
                    ProfileLogoutEvent(),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutActionButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isLogOutButton;

  const _LogoutActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLogOutButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      width: MediaQuery.of(context).size.width / 2,
      onPressed: onPressed,
      color: isLogOutButton ? Colors.red : Colors.grey,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          color: isLogOutButton ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
