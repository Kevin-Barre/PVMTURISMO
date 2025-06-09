// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pvmturismo/Negocio/Models/modelo.prueba.dart';
import 'package:pvmturismo/Negocio/Navegacion/provider.dart';
import 'package:pvmturismo/Negocio/detalles.dart';

class CarruselLugares extends StatefulWidget {
  final List<DataModel>? lugares;

  const CarruselLugares({super.key, this.lugares});

  @override
  // ignore: library_private_types_in_public_api
  _CarruselLugaresState createState() => _CarruselLugaresState();
}

class _CarruselLugaresState extends State<CarruselLugares> {
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
    // Determinar qué lista usar: la pasada como parámetro o la del Provider
    List<DataModel> lugaresAUsar;

    if (widget.lugares != null) {
      // Si se pasaron lugares específicos, usar esos
      lugaresAUsar = widget.lugares!;
    } else {
      // Si no, usar los del Provider (comportamiento original)
      final searchProvider = Provider.of<SearchProvider>(context);
      lugaresAUsar = searchProvider.filteredItems;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.73,
            child: PageView.builder(
              itemCount: lugaresAUsar.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(index, lugaresAUsar[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselView(int index, DataModel data) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(angle: pi * value, child: carouselCard(data));
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(data: data),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: AssetImage(data.imageName),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
