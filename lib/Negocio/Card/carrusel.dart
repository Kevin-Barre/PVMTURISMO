import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Models/modelos.dart';

class Carrusel extends StatefulWidget {
  const Carrusel({super.key});

  @override
  _CarruselScreenState createState() => _CarruselScreenState();
}

class _CarruselScreenState extends State<Carrusel> {
  late PageController _pageController;
  final int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.99,
            child: PageView.builder(
              itemCount: imageList.length,
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(imageList[index].imagePath),
        );
      },
    );
  }

  Widget carouselCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Hero(
        tag: imagePath,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.white30,
                ),
              ],
            ),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
