import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Card/cardlugares.dart';

class CardsGrid extends StatelessWidget {
  const CardsGrid({super.key});

  // Lista de datos para las tarjetas
  final List<Map<String, String>> data = const [
    {'title': 'Senderismo', 'image': 'assets/icons8-senderismo-40.png'},
    {
      'title': 'Balnearios Artificiales',
      'image': 'assets/icons8-piscina-100.png',
    },
    {'title': 'Rios', 'image': 'assets/icons8-nadar-96.png'},
    {
      'title': 'Espacions Recreativos',
      'image': 'assets/icons8-zona-segura-para-niños-64.png',
    },
    {'title': 'Hosterias', 'image': 'assets/icons8-persona-en-la-cama-96.png'},
    {'title': 'Hoteles', 'image': 'assets/icons8-hotel-96.png'},
    {'title': 'Restaurantes', 'image': 'assets/icons8-restaurante--96.png'},
    {'title': 'Huecas', 'image': 'assets/icons8-real-food-for-meals-100.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 0.75,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:
          data.map((item) {
            return InfoCardInicio(title: item['title']!, image: item['image']!);
          }).toList(),
    );
  }
}
