import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/screen.dart';

class BackgroundWidget extends StatefulWidget {
  Widget child;
  BackgroundWidget({required this.child});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(1, 45, 61, 1),
                Color.fromARGB(255, 23, 189, 156),
              ],
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}
