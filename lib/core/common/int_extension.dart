extension IntExtension on int {
  String toCommentWord() {
    return switch (this) {
      var n when n % 10 == 1 && n % 100 != 11 => 'комментарий',
      var n when (n % 10 >= 2 && n % 10 <= 4) && !(n % 100 >= 12 && n % 100 <= 14) => 'комментария',
      _ => 'комментариев',
    };
  }
}
