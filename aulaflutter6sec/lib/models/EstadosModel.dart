/// id : 11
/// sigla : "RO"
/// nome : "Rondônia"
/// regiao : {"id":1,"sigla":"N","nome":"Norte"}

class EstadosModel {
  EstadosModel({
      int? id, 
      String? sigla, 
      String? nome, 
      Regiao? regiao,}){
    _id = id;
    _sigla = sigla;
    _nome = nome;
    _regiao = regiao;
}

  EstadosModel.fromJson(dynamic json) {
    _id = json['id'];
    _sigla = json['sigla'];
    _nome = json['nome'];
    _regiao = json['regiao'] != null ? Regiao.fromJson(json['regiao']) : null;
  }
  int? _id;
  String? _sigla;
  String? _nome;
  Regiao? _regiao;
EstadosModel copyWith({  int? id,
  String? sigla,
  String? nome,
  Regiao? regiao,
}) => EstadosModel(  id: id ?? _id,
  sigla: sigla ?? _sigla,
  nome: nome ?? _nome,
  regiao: regiao ?? _regiao,
);
  int? get id => _id;
  String? get sigla => _sigla;
  String? get nome => _nome;
  Regiao? get regiao => _regiao;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sigla'] = _sigla;
    map['nome'] = _nome;
    if (_regiao != null) {
      map['regiao'] = _regiao?.toJson();
    }
    return map;
  }

}

/// id : 1
/// sigla : "N"
/// nome : "Norte"

class Regiao {
  Regiao({
      int? id, 
      String? sigla, 
      String? nome,}){
    _id = id;
    _sigla = sigla;
    _nome = nome;
}

  Regiao.fromJson(dynamic json) {
    _id = json['id'];
    _sigla = json['sigla'];
    _nome = json['nome'];
  }
  int? _id;
  String? _sigla;
  String? _nome;
Regiao copyWith({  int? id,
  String? sigla,
  String? nome,
}) => Regiao(  id: id ?? _id,
  sigla: sigla ?? _sigla,
  nome: nome ?? _nome,
);
  int? get id => _id;
  String? get sigla => _sigla;
  String? get nome => _nome;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sigla'] = _sigla;
    map['nome'] = _nome;
    return map;
  }

}