import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_states.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onTap;
  const SignInButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthStates>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onTap,
          child: state.mapOrElse(
            loading: () => SizedBox(width: 16, height: 16, child: CircularProgressIndicator()),
            orElse: () => Text('Войти'),
          ),
        );
      },
    );
  }
}
