import 'package:flutter/material.dart';
import 'package:pvmturismo/Negocio/Models/modelo.prueba.dart';

class SearchProvider extends ChangeNotifier {
  final List<DataModel> _allItems = dataList;
  List<DataModel> _filteredItems = dataList;
  String _currentQuery = '';

  List<DataModel> get filteredItems => _filteredItems;
  String get currentQuery => _currentQuery;
  bool get isSearching => _currentQuery.isNotEmpty;

  void filterItems(String query) {
    // MEJORA 1: Usar trim() para eliminar espacios al inicio y final
    _currentQuery = query.trim();

    if (_currentQuery.isEmpty) {
      _filteredItems = List.from(_allItems);
    } else {
      final lowerQuery = _currentQuery.toLowerCase();
      _filteredItems =
          _allItems.where((item) {
            // Debug: Imprime los valores que se están comparando
            debugPrint(
              'Buscando: "$lowerQuery" en "${item.title}" y "${item.categoria}"',
            );

            // MEJORA 2: También hacer trim() a los campos de búsqueda por si acaso
            final matches =
                item.title.trim().toLowerCase().contains(lowerQuery) ||
                item.categoria.trim().toLowerCase().contains(lowerQuery);

            debugPrint('Resultado: $matches');
            return matches;
          }).toList();
    }

    // Debug: Imprime los resultados finales
    debugPrint('Query final: "$_currentQuery"');
    debugPrint('Resultados encontrados: ${_filteredItems.length}');
    notifyListeners();
  }

  void resetSearch() {
    _currentQuery = '';
    _filteredItems = List.from(_allItems);
    notifyListeners();
  }
}
