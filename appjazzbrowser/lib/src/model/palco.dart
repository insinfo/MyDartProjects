import 'dart:async';
import 'dart:core';
import 'atracao.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';
import '../components/data_table_component/serialization_interface.dart';
//palcos

class Palco implements ISerialization, HasUIDisplayName {
  int id;
  String nome;
  String descricao;
  String imagem;
  String video;
  String logradouro;
  String tipoLogradouro;
  String numero;
  String bairro;
  DateTime data;
  List<Atracao> atracoes;

  Palco(
      {this.id,
      this.nome,
      this.descricao,
      this.imagem,
      this.video,
      this.logradouro,
      this.tipoLogradouro,
      this.numero,
      this.bairro,
      this.data});

  Palco.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.descricao = json['descricao'];
    this.imagem = json['imagem'];
    this.video = json['video'];
    this.logradouro = json['logradouro'];
    this.tipoLogradouro = json['tipoLogradouro'];
    this.numero = json['numero'];
    this.bairro = json['bairro'];
    this.data = json.containsKey('data') ? DateTime.tryParse(json['data'].toString()) : null;
    if (json['atracoes'] != null) {
      atracoes = new List<Atracao>();
      json['palcos'].forEach((v) {
        atracoes.add(new Atracao.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    data['video'] = this.video;
    data['logradouro'] = this.logradouro;
    data['tipoLogradouro'] = this.tipoLogradouro;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['data'] = this.data;
    if (this.atracoes != null) {
      data['atracoes'] = this.atracoes.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<Map<String, dynamic>> toDisplayNames() {
    var list = new List<Map<String, dynamic>>();
    list.add({"key": "id", "type": "number", "title": "Id"});
    list.add({"key": "nome", "type": "string", "limit": 60, "title": "Nome"});
    list.add({
      "key": "descricao",
      "type": "string",
      "limit": 60,
      "title": "Descrição"
    });
    list.add({"key": "imagem", "type": "img", "title": "Imagem"});
    list.add({"key": "video", "type": "string", "title": "Video"});
    list.add({"key": "tipoLogradouro", "type": "string", "title": "Tipo"});
    list.add({"key": "logradouro", "string": "url", "title": "Logradouro"});
    list.add({"key": "numero", "type": "string", "title": "Número"});
    list.add({"key": "bairro", "type": "string", "title": "Bairro"});
    list.add({"key": "data", "type": "date", "title": "Data"});
    return list;
  }

  @override
  String get uiDisplayName => nome;
}
