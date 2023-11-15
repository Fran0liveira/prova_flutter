import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class AuthApi {
  static const BASE_URL = 'https://65551a7863cafc694fe77028.mockapi.io/api/v1/';

  Future<bool> isAuthenticated(String user, String password) async {
    Dio dio = Dio();

    Response resp = await dio.get(BASE_URL + '/credenciais');

    List<dynamic> listResponse = resp.data;

    String json = jsonEncode(listResponse);
    List<Map<String, dynamic>> output = (jsonDecode(json) as List).cast();

    for (Map<String, dynamic> map in output) {
      String usuario = map['usuario'];
      String senha = map['senha'];

      if (usuario == user && senha == password) {
        return true;
      }
    }

    return false;
  }
}
