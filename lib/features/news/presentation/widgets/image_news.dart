import 'package:flutter/material.dart';

class ImageNews extends StatelessWidget {
  final String urlToImage;

  const ImageNews({required this.urlToImage, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        child: Image.network(
          urlToImage,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, event) {
            if (event == null) return child;
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
