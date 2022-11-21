/// id_estado : 1
/// descricao : "Alagoas"
/// sigla : "AL"

class EstadoModel {
  EstadoModel({
      this.idEstado, 
      this.descricao, 
      this.sigla,});

  EstadoModel.fromJson(dynamic json) {
    idEstado = json['id_estado'];
    descricao = json['descricao'];
    sigla = json['sigla'];
  }
  int? idEstado;
  String? descricao;
  String? sigla;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_estado'] = idEstado;
    map['descricao'] = descricao;
    map['sigla'] = sigla;
    return map;
  }

}