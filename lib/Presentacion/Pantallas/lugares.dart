import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Navegacion/barraNavegacion.dart';

class Locationspage extends StatelessWidget {
  const Locationspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(child: Text("Esta es la página de lugares")),
      bottomNavigationBar: const Barranavegacion(currentIndex: 1),
    );
  }
}
