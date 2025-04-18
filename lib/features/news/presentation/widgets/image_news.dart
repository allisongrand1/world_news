import 'package:flutter/material.dart';

class ImageNews extends StatelessWidget {
  final String urlToImage;

  const ImageNews({required this.urlToImage, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (urlToImage.isEmpty) {
      return Icon(Icons.image_not_supported);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        urlToImage,
        width: screenWidth * 0.25,
        height: screenWidth * 0.18,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
      ),
    );
  }
}
