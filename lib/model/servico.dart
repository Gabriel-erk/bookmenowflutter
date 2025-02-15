import 'package:bookmenowflutter/model/foto.dart';

class Servico {
  int? id;
  String? titulo;
  String? descricao;
  String? valor;
  int? qtdeVotos;
  int? totalVotos;
  String? telefone;
  String? celular;
  String? endereco;
  String? numero;
  String? complemento;
  String? bairro;
  String? cidade;
  String? estado;
  String? cep;
  int? usuarioId;
  int? categoriaId;
  Null? createdAt;
  Null? updatedAt;
  List<Fotos>? fotos;

  Servico(
      {this.id,
      this.titulo,
      this.descricao,
      this.valor,
      this.qtdeVotos,
      this.totalVotos,
      this.telefone,
      this.celular,
      this.endereco,
      this.numero,
      this.complemento,
      this.bairro,
      this.cidade,
      this.estado,
      this.cep,
      this.usuarioId,
      this.categoriaId,
      this.createdAt,
      this.updatedAt,
      this.fotos});

  Servico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    valor = json['valor'];
    qtdeVotos = json['qtde_votos'];
    totalVotos = json['total_votos'];
    telefone = json['telefone'];
    celular = json['celular'];
    endereco = json['endereco'];
    numero = json['numero'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    cep = json['cep'];
    usuarioId = json['usuario_id'];
    categoriaId = json['categoria_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['fotos'] != null) {
      fotos = <Fotos>[];
      json['fotos'].forEach((v) {
        fotos!.add(new Fotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['valor'] = this.valor;
    data['qtde_votos'] = this.qtdeVotos;
    data['total_votos'] = this.totalVotos;
    data['telefone'] = this.telefone;
    data['celular'] = this.celular;
    data['endereco'] = this.endereco;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['cep'] = this.cep;
    data['usuario_id'] = this.usuarioId;
    data['categoria_id'] = this.categoriaId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.fotos != null) {
      data['fotos'] = this.fotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}