import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Card/carruselLugares.dart';
import 'package:pvmturismo/Negocio/Models/modelo.prueba.dart';
import 'package:pvmturismo/Presentacion/Fondo/fondo.dart';

class FilteredListScreen extends StatelessWidget {
  final String categoria;
  final List<DataModel> lugares;

  const FilteredListScreen({
    super.key,
    required this.categoria,
    required this.lugares,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[400],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BackgroundCornerImage(
        imagePath: "assets/ecosistemapvm.png",
        child:
            lugares.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.green),
                      const SizedBox(height: 16),
                      Text(
                        'No hay lugares disponibles\nen esta categoría',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
                : Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "Rutas Disponibles",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(child: CarruselLugares(lugares: lugares)),
                  ],
                ),
      ),
    );
  }
}
