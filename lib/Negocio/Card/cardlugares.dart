import 'package:flutter/material.dart';

class InfoCardInicio extends StatelessWidget {
  final String title;
  final String image;

  const InfoCardInicio({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(6),
      color: Colors.green[50],
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              child: SizedBox(
                height: 40,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            SizedBox(
              height: 60,
              width: 50,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
