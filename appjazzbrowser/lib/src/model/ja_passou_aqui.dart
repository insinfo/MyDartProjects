import 'dart:async';
import 'dart:core';

class JaPassouAqui {
  int id;
  String nome;
  DateTime data;
  String descricao;

  JaPassouAqui({this.id, this.nome, this.data, this.descricao});

  JaPassouAqui.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.data = DateTime.parse(json['data']);
    this.descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = this.id;
    json['nome'] = this.nome;
    json['data'] = this.data;
    json['descricao'] = this.descricao;
    return json;
  }
}
