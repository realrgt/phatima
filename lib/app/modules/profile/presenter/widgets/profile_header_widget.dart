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
        Text(
          'Profile',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 50.0),
        CircleAvatar(
          radius: 60.0,
          foregroundImage: NetworkImage(user.photoURL),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        const SizedBox(height: 10.0),
        Text(
          user.email,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
