import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Card/carrusel.dart';
import 'package:pvmturismo/Negocio/Models/modelosInicio.dart';
import 'package:pvmturismo/Negocio/Navegacion/barraNavegacion.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Image.asset("assets/lpvm_favi.png", height: 50, width: 50),
            ),
            const SizedBox(width: 8),
            const Text(
              "Pedro Vicente Maldonado",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Carrusel(),
                  const SizedBox(height: 15),
                  const Text(
                    "¿Qué Necesitas?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const CardsGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Barranavegacion(currentIndex: 0),
    );
  }
}
