import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';

class UserAvatarSection extends StatelessWidget {
  const UserAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppBloc>().state;
    final ImageProvider<Object> avatarWidget = state is UserAuthenticatedState
        ? NetworkImage(state.userModel.avatar)
        : const AssetImage(
            'assets/images/test.jpg',
          );
    return SizedBox(
      height: 120,
      width: 120,
      child: CircleAvatar(
        backgroundImage: avatarWidget,
      ),
    );
  }
}
