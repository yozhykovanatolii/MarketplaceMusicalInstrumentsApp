import 'package:flutter/material.dart';

class UserAvatarAndFullName extends StatelessWidget {
  final String authorAvatar;
  final String authorFullName;

  const UserAvatarAndFullName({
    super.key,
    required this.authorAvatar,
    required this.authorFullName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: CircleAvatar(
            backgroundImage: NetworkImage(authorAvatar),
          ),
        ),
        Text(
          authorFullName,
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(17),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
