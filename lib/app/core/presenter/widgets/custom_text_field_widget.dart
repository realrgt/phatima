import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.initialValue,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String? initialValue;
  final String hintText;
  final Icon prefixIcon;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: initialValue,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
