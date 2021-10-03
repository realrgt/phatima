import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30.0),
        const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 50.0),
        CircleAvatar(
          radius: 60.0,
          foregroundImage: NetworkImage(user.photoURL),
          backgroundColor: Colors.grey,
        ),
        const SizedBox(height: 10.0),
        Text(
          user.email,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
