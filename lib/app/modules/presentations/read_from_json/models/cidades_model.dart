import 'dart:convert';

class CidadesModel {
  final String cidade;
  final String estado;

  CidadesModel({
    required this.cidade,
    required this.estado
  });

  Map<String, dynamic> toMap() {
    return {
      'cidade': cidade,
      'estado': estado,
    };
  }

  factory CidadesModel.fromMap(Map<String, dynamic> map) {
    return CidadesModel(
      cidade: map['cidade'] ?? '',
      estado: map['estado'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CidadesModel.fromJson(String source) => CidadesModel.fromMap(json.decode(source));
}
