import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.initialValue,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
  }) : super(key: key);

  final String? initialValue;
  final String hintText;
  final Icon prefixIcon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      cursorColor: const Color(0xFF130B1F),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF130B1F), width: 2.0),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
