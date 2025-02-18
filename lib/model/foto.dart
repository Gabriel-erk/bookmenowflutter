class Fotos {
  int? id;
  String? imagem;
  int? servicoId;
  Null createdAt;
  Null updatedAt;

  Fotos({this.id, this.imagem, this.servicoId, this.createdAt, this.updatedAt});

  Fotos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagem = json['imagem'];
    servicoId = json['servico_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imagem'] = this.imagem;
    data['servico_id'] = this.servicoId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}