import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AutenticacaoController with ChangeNotifier {
  bool _carregando = false;

  bool get carregando => _carregando;

  Future acessar(String email, String senha) async {
    _carregando = false;

    notifyListeners();

    final resposta = await http
        .post(Uri.parse('http:// 10.56.46.42/pbookmenowapi.test/api/login'),
         headers: {
      'Accept': 'application/json',
      'Content-Type': 'aplication/json', // transforma em json
    }, body: {
      'email': email,
      'password': senha,
    });
    _carregando = false;

    notifyListeners();
    if (resposta == 200) {
      return true;
    } else {
      return false;
    }
  }
}
