import 'package:world_news/core/common/formatter.dart';

class ValidatorController {
  ValidatorController();

  String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Заполните поле';
    }
    if (!AppFormatters.loginRegExpression.hasMatch(value)) {
      return 'Логин должен содержать буквы, цифры и символы . _';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Заполните поле';
    }

    return null;
  }
}
