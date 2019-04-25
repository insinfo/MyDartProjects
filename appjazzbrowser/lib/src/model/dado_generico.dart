import 'dart:async';
import 'dart:core';

class DadoGenerico {
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
    json['id'] = this.id;
    json['historia'] = this.historia;
    json['palcos'] = this.palcos;
    json['edicoes'] = this.edicoes;
    json['logo'] = this.logo;
    return json;
  }
}
