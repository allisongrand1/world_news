import 'package:flutter/material.dart';

class TextAndIconAuth extends StatelessWidget {
  const TextAndIconAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text('Добро пожаловать!', style: textTheme.headlineLarge),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32, left: 48, right: 48),
          child: Text(
            'Войдите в систему для дальнейшей работы',
            style: textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
