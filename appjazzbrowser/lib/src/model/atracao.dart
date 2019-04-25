import 'dart:async';
import 'dart:core';

//atrações
class Atracao {
  int id;
  String nome;
  String descricao;
  int ano;
  DateTime data;
  String imagem;
  String video;
  String media;

  Atracao(
      {this.id,
      this.nome,
      this.descricao,
      this.ano,
      this.data,
      this.imagem,
      this.video,
      this.media});

  Atracao.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.descricao = json['descricao'];
    this.ano = json['ano'];
    this.data = DateTime.parse(json['data']);
    this.imagem = json['imagem'];
    this.video = json['video'];
    this.media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = this.id;
    json['nome'] = this.nome;
    json['descricao'] = this.descricao;
    json['ano'] = this.ano;
    json['data'] = this.data;
    json['imagem'] = this.imagem;
    json['video'] = this.video;
    json['media'] = this.media;
    return json;
  }
}
