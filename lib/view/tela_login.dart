import 'package:bookmenowflutter/controller/autenticacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginEstado();
}

class _TelaLoginEstado extends State<TelaLogin> {
  // váriaveis que terão os valores que serão passados para os campos do formulário
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final autenticacaoController = Provider.of<AutenticacaoController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // formulário
        child: Form(
          // column me permite organizar os widgets em colunas, e vários por conta do children
          child: Column(
            children: [
              // todo textFormField tem um controller
              TextFormField(
                controller: _emailController,
                // decoração, o que aparece no campo quando está vazio (placeholder basicamente)
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true, // esconde a senha
              ),
              // se estiver carregando chama circularprogress (mostra um circulo enquanto carrega), se não chama o botão
              autenticacaoController.carregando
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        bool sucesso = await autenticacaoController.acessar(
                            _emailController.text, _senhaController.text);

                        if (sucesso) {
                          print("conectado");
                        } else {
                          print("erro no e-mail ou senha");
                        }
                      },
                      child: const Text("Entrar"),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
