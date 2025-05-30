import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconsRow extends StatelessWidget {
  final double iconSize;
  final MainAxisAlignment alignment;

  const SocialIconsRow({
    super.key,
    this.iconSize = 22.0,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        _buildIcon(
          FontAwesomeIcons.facebook,
          Colors.blue[800]!,
          "https://www.facebook.com/gadmpvm",
        ),
        _buildIcon(
          FontAwesomeIcons.instagram,
          Colors.pink[400]!,
          "https://www.instagram.com/gadmpvm/",
        ),
        _buildIcon(
          FontAwesomeIcons.tiktok,
          Colors.black,
          "https://www.tiktok.com/@gadmpvm",
        ),
        _buildIcon(
          FontAwesomeIcons.globe,
          Colors.lightBlueAccent,
          "https://www.pedrovicentemaldonado.gob.ec/",
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon, Color color, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            throw "No se puede abrir el enlace";
          }
        },
        child: FaIcon(icon, size: iconSize, color: color),
      ),
    );
  }
}
