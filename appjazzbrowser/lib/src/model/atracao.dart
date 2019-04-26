import 'dart:async';
import 'dart:core';
import '../serialization_interface.dart';
//atrações
class Atracao implements ISerialization{
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

  List<Map<String, dynamic>> toDisplayNames() {
    var list = new List<Map<String, dynamic>>();
    list.add({"key":"id","type":"number","title":"Id"});
    list.add({"key":"nome","type":"string","limit":60,"title":"Nome"});
    list.add({"key":"ano","type":"number","title":"Ano"});
    list.add({"key":"data","type":"number","title":"Data"});
    list.add({"key":"descricao","type":"string","limit":60,"title":"Descrição"});
    list.add({"key":"video","type":"url","title":"Video"});
    list.add({"key":"media","type":"url","title":"Media"});
    list.add({"key":"imagem","type":"img","title":"Imagem"});
   return list;
  }
}
