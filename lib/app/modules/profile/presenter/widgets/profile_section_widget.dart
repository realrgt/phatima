import 'package:flutter/material.dart';

import '../../../../core/presenter/widgets/custom_text_field_widget.dart';
import '../../domain/entities/user.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save,
              color: Color(0xFF130B1F),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          user.uid,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        CustomTextField(initialValue: user.displayName, hintText: 'Name'),
        const SizedBox(height: 12.0),
        CustomTextField(initialValue: user.phone, hintText: 'Telefone'),
        const SizedBox(height: 12.0),
        CustomTextField(initialValue: user.address, hintText: 'Address'),
      ],
    );
  }
}
