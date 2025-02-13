import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  const TelaServico({super.key});

  @override
  State<TelaServico> createState() => _TelaServicoEstado();
}

class _TelaServicoEstado extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serviços"),
      ),
      body: const Center(child: Text("Bem vindo a tela de serviçõs"),),
    );
  }
}
