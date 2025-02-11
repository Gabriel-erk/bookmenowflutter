import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AutenticacaoController with ChangeNotifier {
  bool _carregando = false;

  bool get carregando => _carregando;

  Future acessar(String email, String senha) async {
    _carregando = false;

    notifyListeners();

    final resposta = await http.post(
      Uri.parse('http://10.56.46.42/public/api/login'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json', // transforma em json
      },
      body: jsonEncode(
        {
          'email': email,
          'password': senha,
        },
      ),
    );
    _carregando = false;

    notifyListeners();
    if (resposta.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
