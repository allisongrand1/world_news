import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_events.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_states.dart';
import 'package:world_news/features/auth/presentation/controllers/validator_controller.dart';
import 'package:world_news/features/auth/presentation/mixins/auth_text_field_mixin.dart';
import 'package:world_news/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:world_news/features/auth/presentation/widgets/sign_in_button.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> with AuthTextFieldMixin {
  final ValidatorController validatorController = ValidatorController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    initTextControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        state.mapOrElse(
          error: (error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Ошибка авторизации. Попробуйте еще раз')));
          },
          orElse: () {},
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthTextField(
              controller: loginController,
              labelText: 'Login',
              validator: validatorController.validateLogin,
            ),
            AuthTextField(
              controller: passwordController,
              labelText: 'Password',
              validator: validatorController.validatePassword,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SignInButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                      AuthEvents.login(login: loginController.text, password: passwordController.text),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
