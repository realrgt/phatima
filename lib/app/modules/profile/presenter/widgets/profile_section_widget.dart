import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/presenter/widgets/custom_text_field_widget.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';
import '../bloc/bloc.dart';

// ignore: must_be_immutable
class ProfileSection extends StatelessWidget {
  final User user;
  ProfileSection({Key? key, required this.user}) : super(key: key);

  final _profileBloc = Modular.get<ProfileBloc>();

  late String _username = user.displayName;
  late String? _phone = user.phone;
  late String? _address = user.address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              final updatedUser = UserModel(
                uid: user.uid,
                photoURL: user.photoURL,
                displayName: _username,
                email: user.email,
                phone: _phone,
                address: _address,
              );

              _profileBloc.sink.add(UpdatedProfile(user: updatedUser));
            },
            icon: const Icon(Icons.save, color: Color(0xFF130B1F)),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          user.uid,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          initialValue: user.displayName,
          prefixIcon: const Icon(Icons.person, color: Colors.grey),
          hintText: 'Name',
          onChanged: (value) => _username = value,
        ),
        const SizedBox(height: 12.0),
        CustomTextField(
          initialValue: user.phone,
          prefixIcon: const Icon(Icons.phone, color: Colors.grey),
          hintText: 'Telefone',
          onChanged: (value) => _phone = value,
        ),
        const SizedBox(height: 12.0),
        CustomTextField(
          initialValue: user.address,
          prefixIcon: const Icon(Icons.place, color: Colors.grey),
          hintText: 'Address',
          onChanged: (value) => _address = value,
        ),
      ],
    );
  }
}
