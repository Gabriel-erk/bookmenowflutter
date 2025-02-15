// import 'package:bookmenow_flutter/controller/servico_controller.dart';
import 'package:bookmenowflutter/controller/servico_controller.dart';
import 'package:bookmenowflutter/model/servico.dart';
import 'package:flutter/material.dart';

// import 'package:bookmenow_flutter/model/servico.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaServicosEstado createState() => _TelaServicosEstado();
}

class _TelaServicosEstado extends State<TelaServico> {
  List<Servico> servicos = [];

  @override
  void initState() {
    super.initState();
    carregarServicos();
  }

  void carregarServicos() async {
    ServicoController servicoController = ServicoController();
    List<Servico> lista = await servicoController.buscarServicos(context);
    setState(() {
      servicos = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Serviços')),
      body: servicos.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator()) // Mostra indicador de carregamento
          : ListView.builder(
              itemCount: servicos.length,
              itemBuilder: (context, index) {
                Servico servico = servicos[index];
                String? foto =
                    (servico.fotos != null && servico.fotos!.isNotEmpty)
                        ? servico.fotos![0].imagem
                        : null;

                return ListTile(
                  leading: foto != null
                      ? Image.network(foto,
                          width: 150, height: 150, fit: BoxFit.cover)
                      : Icon(Icons.error, size: 50), // Ícone se não houver foto
                  title: Text(servico.titulo ?? "Sem título"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(servico.valor ?? "Sem valor"),
                      Text(servico.celular ?? "Sem contato"),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
