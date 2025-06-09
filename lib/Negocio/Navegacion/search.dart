import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pvmturismo/Negocio/Navegacion/provider.dart';
import 'dart:async';

class BuscadorInicio extends StatefulWidget {
  const BuscadorInicio({super.key});

  @override
  State<BuscadorInicio> createState() => _BuscadorInicioState();
}

class _BuscadorInicioState extends State<BuscadorInicio> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchProvider>(context, listen: false).resetSearch();
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12),
      child: Material(
        elevation: 7,
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.black45,
        child: TextField(
          controller: _controller,
          // OPCIÓN 2: Búsqueda inmediata (más simple)
          onChanged: (query) {
            Provider.of<SearchProvider>(
              context,
              listen: false,
            ).filterItems(query);
          },

          // OPCIÓN 3: Búsqueda solo cuando termine de escribir
          // onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Buscar...',
            prefixIcon: const Icon(Icons.search),
            // Agregar botón para limpiar
            suffixIcon:
                _controller.text.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                        Provider.of<SearchProvider>(
                          context,
                          listen: false,
                        ).resetSearch();
                      },
                    )
                    : null,
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
