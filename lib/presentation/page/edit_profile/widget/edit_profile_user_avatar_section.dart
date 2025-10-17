import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';

class EditProfileUserAvatarSection extends StatelessWidget {
  const EditProfileUserAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        children: [
          _EditProfileAvatar(),
          Positioned(
            right: 0.5,
            bottom: 1,
            child: _EditAvatarButton(),
          ),
        ],
      ),
    );
  }
}

class _EditProfileAvatar extends StatelessWidget {
  const _EditProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final userAvatarUrl = context.select(
      (EditProfileBloc bloc) => bloc.state.avatarUrl,
    );
    return SizedBox(
      height: 120,
      width: 120,
      child: CircleAvatar(
        backgroundImage: userAvatarUrl.isEmpty
            ? const AssetImage(
                'assets/images/test.jpg',
              )
            : NetworkImage(userAvatarUrl),
      ),
    );
  }
}

class _EditAvatarButton extends StatelessWidget {
  const _EditAvatarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        context.read<EditProfileBloc>().add(
          ProfileAvatarChangeEvent(),
        );
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.blue),
      ),
      icon: const Icon(
        Iconsax.edit_copy,
      ),
    );
  }
}
