import 'dart:async';
import 'dart:core';
import 'atracao.dart';
import 'palco.dart';
//class de ligação palco atração

class PalcoAtracao {
  int id;
  Atracao atracao;
  Palco palco;
  DateTime data;

  PalcoAtracao({this.id, this.atracao, this.palco,this.data});

  PalcoAtracao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    atracao =
    json['atracao'] != null ? new Atracao.fromJson(json['atracao']) : null;
    palco = json['palco'] != null ? new Palco.fromJson(json['palco']) : null;
    data = DateTime.tryParse(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.id != null) {
      data['id'] = this.id;
    }
    if (this.atracao != null) {
      data['atracao'] = this.atracao.toJson();
    }
    if (this.palco != null) {
      data['palco'] = this.palco.toJson();
    }
    return data;
  }
}