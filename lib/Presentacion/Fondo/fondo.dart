import 'package:flutter/material.dart';

class BackgroundCornerImage extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const BackgroundCornerImage({
    super.key,
    required this.child,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -80,
          right: -100,
          child: Opacity(
            opacity: 0.25,
            child: Container(
              height: 600,
              width: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        // Contenido principal
        child,
      ],
    );
  }
}
