/// id_mercadoria : 1
/// descricao : "CESTA BÁSICA"

class MercadoriaModel {
  MercadoriaModel({
      this.idMercadoria, 
      this.descricao,});

  MercadoriaModel.fromJson(dynamic json) {
    idMercadoria = json['id_mercadoria'];
    descricao = json['descricao'];
  }
  int? idMercadoria;
  String? descricao;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_mercadoria'] = idMercadoria;
    map['descricao'] = descricao;
    return map;
  }

}