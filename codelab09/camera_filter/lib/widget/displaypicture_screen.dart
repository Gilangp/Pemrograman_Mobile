import 'dart:io';
import 'package:flutter/material.dart';
import 'filter_carousel.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview & Filter')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PhotoFilterCarousel(
              imagePath: imagePath,
            ),
          ),
        ],
      ),
    );
  }
}
