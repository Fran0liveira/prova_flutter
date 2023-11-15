import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliticaWidget extends StatefulWidget {
  const PoliticaWidget({super.key});

  @override
  State<PoliticaWidget> createState() => _PoliticaWidgetState();
}

class _PoliticaWidgetState extends State<PoliticaWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _redirectToBrowser();
      },
      child: Container(
          padding: EdgeInsets.all(30),
          child: Text(
            'Política de Privacidade',
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }

  _redirectToBrowser() async {
    var uri = Uri.parse("https://www.google.com.br");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // can't launch url
    }
  }
}
