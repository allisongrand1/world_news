import 'package:flutter/material.dart';

class NewsLoadingView extends StatelessWidget {
  const NewsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
