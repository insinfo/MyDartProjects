import 'dart:async';
import 'dart:core';
import 'atracao.dart';
import 'package:intl/intl.dart';
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
  String data;
  String hora;
  bool selected = false;
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
      this.data,
      this.hora});

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
    this.selected = json.containsKey('selected') ? json['selected'] : false;
    if (json.containsKey('data')) {
      var formatD = new DateFormat('yyyy-MM-dd');
      var formatH = new DateFormat('HH:mm');
      var d = DateTime.tryParse(json['data'].toString());
      if (d != null) {
        this.data = formatD.format(d);
        this.hora = formatH.format(d);
      }
    }
    if (json['atracoes'] != null) {
      atracoes = new List<Atracao>();
      json['atracoes'].forEach((v) {
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

    if(this.data != null){
      //DateTime d = DateFormat("dd/MM/yyyy").parse(this.data);
     // DateTime h = DateFormat("HH:mm").parse(this.hora);
      data['data'] = DateFormat("yyyy-MM-dd HH:mm").parse("${this.data} ${this.hora}").toString();
    }

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
    list.add({"key": "data", "type": "string", "title": "Data"});
    list.add({"key": "hora", "type": "string", "title": "Data"});
    return list;
  }

  @override
  String get uiDisplayName => nome;
}
