import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;

  const AuthTextField({required this.controller, required this.labelText, this.formatter, this.validator, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: formatter,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
    );
  }
}
