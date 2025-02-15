import 'dart:convert';

import 'package:bookmenowflutter/controller/autenticacao_controller.dart';
import 'package:bookmenowflutter/model/servico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ServicoController {
  Future<List<Servico>> buscarServicos(BuildContext context) async {
    final autenticacao =
        Provider.of<AutenticacaoController>(context, listen: false);
    String? token = autenticacao.token;

    final resposta = await http.get(
      Uri.parse('http://10.56.46.42/public/api/servicos'),
      // Uri.parse('http://10.56.46.42/public/admin/servicos'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      },
    );
    if (resposta.statusCode == 200) {
      // pode conter um serviço, muitos ou nenhum
      List<dynamic> dados = jsonDecode(resposta.body);
      // pega o json, tranforma em um objeto do tipo servico, armazena no mapa e tranforma em uma lista, faz isso com todos (pode ser um, nenhum ou uma lista)
      return dados.map((json) => Servico.fromJson(json)).toList();
    } else {
      print("Erro ao buscar os serviços: ${resposta.statusCode}");
      return [];
    }
  }
}

// http://10.56.46.42/public/api/servicos
