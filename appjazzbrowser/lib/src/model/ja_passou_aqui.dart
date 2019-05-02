import 'dart:async';
import 'dart:core';
import '../components/data_table_component/serialization_interface.dart';
class JaPassouAqui implements ISerialization{
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
    if(this.id != null) {
      json['id'] = this.id;
    }
    json['nome'] = this.nome;
    json['data'] = this.data;
    json['descricao'] = this.descricao;
    return json;
  }

  List<Map<String, dynamic>> toDisplayNames() {
    var list = new List<Map<String, dynamic>>();
    list.add({"key":"id","type":"number","title":"Id"});
    list.add({"key":"nome","type":"string","limit":60,"title":"Nome"});
    list.add({"key":"data","type":"date","title":"Data"});
    list.add({"key":"descricao","type":"string","limit":60,"title":"Descrição"});
    return list;
  }
}
