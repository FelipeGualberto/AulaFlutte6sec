/// id_icms_tipo : 1
/// descricao : "MERCADORIAS"

class IcmsTipoModel {
  IcmsTipoModel({
      this.idIcmsTipo, 
      this.descricao,});

  IcmsTipoModel.fromJson(dynamic json) {
    idIcmsTipo = json['id_icms_tipo'];
    descricao = json['descricao'];
  }
  int? idIcmsTipo;
  String? descricao;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_icms_tipo'] = idIcmsTipo;
    map['descricao'] = descricao;
    return map;
  }

}