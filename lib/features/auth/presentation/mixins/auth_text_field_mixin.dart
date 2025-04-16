import 'package:flutter/material.dart';

mixin AuthTextFieldMixin<T extends StatefulWidget> on State<T> {
  late final TextEditingController loginController;
  late final TextEditingController passwordController;

  void initTextControllers() {
    loginController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }
}
