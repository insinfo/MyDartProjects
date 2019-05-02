import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';
import 'atracao.dart';
import 'palco_atracao.dart';

class Palco extends ManagedObject<_Palco> implements _Palco {
  Palco();

  Palco.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    nome = json['nome'] as String;
    descricao = json['descricao'] as String;
    imagem = json['imagem'] as String;
    video = json['video'] as String;
    logradouro = json['logradouro'] as String;
    tipoLogradouro = json['tipoLogradouro'] as String;
    numero = json['numero'] as String;
    bairro = json['bairro'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) {
      data['id'] = id;
    }
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['imagem'] = imagem;
    data['video'] = video;
    data['logradouro'] = logradouro;
    data['tipoLogradouro'] = tipoLogradouro;
    data['numero'] = numero;
    data['bairro'] = bairro;
    data['data'] = data.toString();
    return data;
  }

  @Serialize(input: true, output: true)
  List<Map<String, dynamic>> atracoes;

  @Serialize(input: true, output: false)
  DateTime data;
}

//palcos
@Table(name: "palcos")
class _Palco {
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
  String logradouro;

  @Column(unique: false, nullable: true)
  String tipoLogradouro;

  @Column(unique: false, nullable: true)
  String numero;

  @Column(unique: false, nullable: true)
  String bairro;

  ManagedSet<PalcoAtracao> palcoAtracao;
}
