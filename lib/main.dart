import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prova_flutter/pages/cadastro_page.dart';
import 'package:prova_flutter/pages/login_page.dart';
import 'package:prova_flutter/routes/app_routes.dart';

import 'widgets/background_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      onGenerateRoute: _onGenerateRoute,
    );
  }
}

Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
  String? route = settings.name;
  Widget widget;
  if (route == AppRoutes.CADASTRO_PAGE) {
    widget = CadastroPage();
  } else {
    widget = LoginPage();
  }

  return MaterialPageRoute(builder: (context) {
    return widget;
  });
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
