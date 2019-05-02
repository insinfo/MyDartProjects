import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';
import 'palco.dart';
import 'palco_atracao.dart';

class Atracao extends ManagedObject<_Atracao> implements _Atracao {
  Atracao();

  Atracao.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    nome = json['nome'] as String;
    descricao = json['descricao'] as String;
    imagem = json['imagem'] as String;
    video = json['video'] as String;
    media = json['media'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (id != null) {
      json['id'] = id;
    }
    json['nome'] = nome;
    json['descricao'] = descricao;
    json['imagem'] = imagem;
    json['video'] = video;
    json['media'] = media;
    return json;
  }

  @Serialize(input: true, output: true)
  List<Map<String, dynamic>> palcos;
}

//atrações
@Table(name: "atracoes")
class _Atracao {
  @Column(
      primaryKey: true,
      unique: true,
      autoincrement: true,
      databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false, nullable: true)
  String nome;

  @Column(unique: false, nullable: true)
  String descricao;

  @Column(unique: false, nullable: true)
  String imagem;

  @Column(unique: false, nullable: true)
  String video;

  @Column(unique: false, nullable: true)
  String media;

  ManagedSet<PalcoAtracao> palcoAtracao;


}
