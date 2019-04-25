import 'dart:async';
import 'dart:core';

class ApoiadorFestival {
  int id;
  String nome;
  String logo;
  String tipo;

  ApoiadorFestival({this.id, this.nome, this.logo, this.tipo});

  ApoiadorFestival.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.logo = json['logo'];
    this.tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = this.id;
    json['nome'] = this.nome;
    json['logo'] = this.logo;
    json['tipo'] = this.tipo;
    return json;
  }
}
