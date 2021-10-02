import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.initialValue,
    required this.hintText,
  }) : super(key: key);

  final String? initialValue;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: const InputDecoration(
        hintText: 'Address',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF130B1F),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
