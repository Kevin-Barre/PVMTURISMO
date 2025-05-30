import 'package:flutter/material.dart';

class BuscadorInicio extends StatelessWidget {
  const BuscadorInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12),
      child: Material(
        elevation: 7,
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.black45,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Buscar...',
            prefixIcon: Icon(Icons.search),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.green),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
