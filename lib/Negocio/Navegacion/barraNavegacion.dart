import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pvmturismo/Presentacion/Pantallas/home.dart';
import 'package:pvmturismo/Presentacion/Pantallas/informatio.dart';
import 'package:pvmturismo/Presentacion/Pantallas/lugares.dart';

class Barranavegacion extends StatefulWidget {
  final int currentIndex;

  const Barranavegacion({super.key, required this.currentIndex});

  @override
  _BarranavegacionState createState() => _BarranavegacionState();
}

class _BarranavegacionState extends State<Barranavegacion>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.react, // Mantenemos el estilo original
      backgroundColor: Colors.green,
      color: Colors.white,
      activeColor: const Color.fromARGB(255, 0, 255, 8),
      initialActiveIndex: _currentIndex,
      curve: Curves.easeInOut,
      onTap: (index) {
        if (index == _currentIndex) return;

        _animationController.reset();
        _animationController.forward();

        _navigateWithAnimation(context, index);
      },
      items: const [
        TabItem(icon: Icons.home_work_outlined, title: 'Inicio'),
        TabItem(icon: Icons.location_on_outlined, title: 'Lugares'),
        TabItem(icon: Icons.info_outline, title: 'Acerca de'),
      ],
    );
  }

  void _navigateWithAnimation(BuildContext context, int index) {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => _getPage(index),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutQuad),
            ),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );

    Navigator.of(context).pushReplacement(route).then((_) {
      if (mounted) {
        setState(() {
          _currentIndex = index;
        });
      }
    });
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const Locationspage();
      case 2:
        return const InformactionPage();
      default:
        return const HomePage();
    }
  }
}
