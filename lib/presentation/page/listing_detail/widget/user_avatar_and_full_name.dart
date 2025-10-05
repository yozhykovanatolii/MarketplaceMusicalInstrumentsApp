import 'package:flutter/material.dart';

class UserAvatarAndFullName extends StatelessWidget {
  const UserAvatarAndFullName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        const SizedBox(
          height: 60,
          width: 60,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/test.jpg',
            ),
          ),
        ),
        Text(
          'Yozhykov Andrey',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(17),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
