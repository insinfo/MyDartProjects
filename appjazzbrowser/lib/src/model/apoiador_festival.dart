import 'dart:async';
import 'dart:core';
import '../components/data_table_component/serialization_interface.dart';

class ApoiadorFestival implements ISerialization{
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
    if(this.id != null) {
      json['id'] = this.id;
    }
    json['nome'] = this.nome;
    json['logo'] = this.logo;
    json['tipo'] = this.tipo;
    return json;
  }

  List<Map<String, dynamic>> toDisplayNames() {
    var list = new List<Map<String, dynamic>>();
    list.add({"key":"id","type":"number"});
    list.add({"key":"nome","type":"string","limit":60});
    list.add({"key":"logo","type":"img"});
    list.add({"key":"tipo","type":"string"});
    return list;
  }
}
