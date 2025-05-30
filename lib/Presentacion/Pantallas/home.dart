import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Card/carrusel.dart';
import 'package:pvmturismo/Negocio/Models/modelosInicio.dart';
import 'package:pvmturismo/Negocio/Navegacion/barraNavegacion.dart';
import 'package:pvmturismo/Negocio/Navegacion/search.dart';
import 'package:pvmturismo/Presentacion/Modelo3D/logo3d.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _mostrarPopupModelo3D(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Model3DViewerPopup(),
    );
  }

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
              onTap: () => _mostrarPopupModelo3D(context),
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Carrusel(),
            SizedBox(height: 15),
            BuscadorInicio(),
            SizedBox(height: 15),

            Text(
              "¿Qué Necesitas?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 15),

            CardsGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const Barranavegacion(currentIndex: 0),
    );
  }
}
