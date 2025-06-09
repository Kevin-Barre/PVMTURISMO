// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pvmturismo/Negocio/Navegacion/provider.dart';
import 'package:pvmturismo/Presentacion/Pantallas/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SearchProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  bool _lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _lastPage = index == 2;
              });
            },
            children: [
              buildPage("assets/logopvm.jpg", "", ""),
              buildPage(
                "assets/nochepvm.jpg",
                "¡Bienvenido!",
                "Explora  nuestro querido cantón Pedro Vicente Maldonado.",
              ),
              buildPage(
                "assets/ratardecerpvm.jpg",
                "Conoce lugares",
                "Descubre nuevos sitios.",
              ),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
              child: Text("Omitir", style: TextStyle(color: Colors.white)),
            ),
          ),
          if (_lastPage)
            Positioned(
              bottom: 70,
              left: MediaQuery.of(context).size.width * 0.38,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
                child: Text("Empezar"),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildPage(String imgPath, String title, String subtitle) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(imgPath, fit: BoxFit.cover),
        // ignore: deprecated_member_use
        Container(color: Colors.black.withOpacity(0.3)),
        // Contenido del onboarding
        Padding(
          padding: const EdgeInsets.only(bottom: 130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
