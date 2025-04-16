import 'package:flutter/material.dart';
import 'package:world_news/features/auth/presentation/views/auth_form.dart';
import 'package:world_news/features/auth/presentation/widgets/text_and_icon_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [TextAndIconAuth(), AuthForm()]),
        ),
      ),
    );
  }
}
