import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Card/carruselLugares.dart';
import 'package:pvmturismo/Negocio/Navegacion/barraNavegacion.dart';
import 'package:pvmturismo/Negocio/Navegacion/search.dart';
import 'package:pvmturismo/Presentacion/Fondo/fondo.dart';

class Locationspage extends StatelessWidget {
  const Locationspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/lpvm_favi.png", height: 50, width: 50),
            const SizedBox(width: 8),
            const Text(
              "Pedro Vicente Maldonado",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: BackgroundCornerImage(
        imagePath: "assets/ecosistemapvm.png",
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                "Explora nuestros lugares turísticos",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 15),
              BuscadorInicio(),
              CarruselLugares(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Barranavegacion(currentIndex: 1),
    );
  }
}
