import 'package:flutter/material.dart';

class NewsErrorView extends StatelessWidget {
  final String error;
  const NewsErrorView(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
