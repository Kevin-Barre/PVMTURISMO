import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Card/card.dart';
import 'package:pvmturismo/Negocio/Card/carrusel.dart';
import 'package:pvmturismo/Negocio/Navegacion/barraNavegacion.dart';
import 'package:pvmturismo/Presentacion/RedesSociales/redes.dart';

class InformactionPage extends StatelessWidget {
  const InformactionPage({super.key});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Carrusel(),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  InfoCard(
                    title: "🧭 Misión",
                    content:
                        "Promover el desarrollo turístico sostenible de Pedro Vicente Maldonado mediante una aplicación interactiva que conecta a visitantes con la riqueza natural, cultural y comunitaria del cantón, facilitando el acceso a rutas, experiencias y emprendimientos locales.",
                  ),
                  SizedBox(width: 16),
                  InfoCard(
                    title: "🎯 Visión",
                    content:
                        "Convertir a Pedro Vicente Maldonado en un referente nacional del turismo comunitario digitalizado, fortaleciendo el vínculo entre tecnología, comunidad y naturaleza para impulsar el bienestar local y la identidad territorial.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SocialIconsRow(),
          ],
        ),
      ),
      bottomNavigationBar: const Barranavegacion(currentIndex: 2),
    );
  }
}
