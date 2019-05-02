import 'dart:async';
import 'dart:core';
import '../components/data_table_component/serialization_interface.dart';
import 'palco.dart';
//atrações
class Atracao implements ISerialization{
  int id;
  String nome;
  String descricao;
  String imagem;
  String video;
  String media;
  List<Palco> palcos;

  Atracao(
      {this.id,
      this.nome,
      this.descricao,
      this.imagem,
      this.video,
      this.media});


  Atracao.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.descricao = json['descricao'];
    this.imagem = json['imagem'];
    this.video = json['video'];
    this.media = json['media'];

    if (json['palcos'] != null) {
      palcos = new List<Palco>();
      json['palcos'].forEach((v) {
        palcos.add(new Palco.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    if(this.id != null) {
      json['id'] = this.id;
    }
    json['nome'] = this.nome;
    json['descricao'] = this.descricao;
    json['imagem'] = this.imagem;
    json['video'] = this.video;
    json['media'] = this.media;
    if (this.palcos != null) {
      json['palcos'] = this.palcos.map((p) => p.toJson()).toList();
    }
    return json;
  }

  List<Map<String, dynamic>> toDisplayNames() {
    var list = new List<Map<String, dynamic>>();
    list.add({"key":"id","type":"number","title":"Id"});
    list.add({"key":"nome","type":"string","limit":60,"title":"Nome"});
    list.add({"key":"descricao","type":"string","limit":60,"title":"Descrição"});
    list.add({"key":"video","type":"url","title":"Video"});
    list.add({"key":"media","type":"url","title":"Media"});
    list.add({"key":"imagem","type":"img","title":"Imagem"});
   return list;
  }
}

