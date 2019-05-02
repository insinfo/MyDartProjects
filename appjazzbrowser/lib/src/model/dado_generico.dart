import 'dart:async';
import 'dart:core';
import '../components/data_table_component/serialization_interface.dart';
class DadoGenerico implements ISerialization{
  int id;
  String historia;
  String palcos;
  int edicoes;
  String logo;

  DadoGenerico({this.id, this.historia, this.palcos, this.edicoes, this.logo});

  DadoGenerico.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.historia = json['historia'];
    this.palcos = json['palcos'];
    this.edicoes = json['edicoes'];
    this.logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    if(this.id != null) {
      json['id'] = this.id;
    }
    json['historia'] = this.historia;
    json['palcos'] = this.palcos;
    json['edicoes'] = this.edicoes;
    json['logo'] = this.logo;
    return json;
  }

  List<Map<String, dynamic>> toDisplayNames() {
    var list = new List<Map<String, dynamic>>();
    list.add({"key":"id","type":"number","title":"Id"});
    list.add({"key":"historia","type":"string","limit":60,"title":"História"});
    list.add({"key":"palcos","type":"string","limit":60,"title":"Palcos"});
    list.add({"key":"edicoes","type":"string","limit":60,"title":"Edições"});
    list.add({"key":"logo","type":"img","title":"Logo"});
    return list;
  }
}
