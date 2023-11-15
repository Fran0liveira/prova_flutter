import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prova_flutter/api/auth_api.dart';
import 'package:prova_flutter/utils/screen.dart';
import 'package:prova_flutter/widgets/app_textfield.dart';
import 'package:prova_flutter/widgets/background_widget.dart';
import 'package:prova_flutter/widgets/politica_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../routes/app_routes.dart';
import '../utils/string_utils.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Screen.of(context).height,
                child: Column(
                  children: [
                    Expanded(child: _form()),
                    PoliticaWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _form() {
    return Form(
      key: _formKey,
      child: Container(
        width: Screen.of(context).width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(
              icon: Icons.person,
              controller: _loginController,
              label: 'Usuário',
              validator: (value) {
                if (StringUtils.isNullOrEmpty(value)) {
                  return 'Necessário informar o usuário!';
                }
                if (value!.length > 20) {
                  return 'Campo usuário não pode exceder 20 caracteres!';
                }

                if (value.endsWith(' ')) {
                  return 'Campo usuário não pode terminar com espaço!';
                }
              },
              password: false,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              icon: Icons.lock,
              controller: _passwordController,
              label: 'Senha',
              validator: (value) {
                if (StringUtils.isNullOrEmpty(value)) {
                  return 'Necessário informar a senha!';
                }

                if (value!.length < 2) {
                  return 'Campo senha precisa ter ao menos 2 caracteres!';
                }

                if (value.length > 20) {
                  return 'Campo senha não pode exceder 20 caracteres!';
                }
                if (value.endsWith(' ')) {
                  return 'Campo senha não pode terminar com espaço!';
                }
              },
              password: true,
            ),
            SizedBox(
              height: 20,
            ),
            _btnEntrar(),
          ],
        ),
      ),
    );
  }

  _btnEntrar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Screen.of(context).width * 0.4,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                )),
            onPressed: () {
              _entrar();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Entrar',
              ),
            ),
          ),
        ),
      ],
    );
  }

  _entrar() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    bool isAuthenticated = await AuthApi()
        .isAuthenticated(_loginController.text, _passwordController.text);

    if (!isAuthenticated) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Usuário ou Senha inválidos!')));
      return;
    }
    Navigator.of(context).pushReplacementNamed(AppRoutes.CADASTRO_PAGE);
  }
}
