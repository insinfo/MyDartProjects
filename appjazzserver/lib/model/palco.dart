import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';
import 'atracao.dart';
import 'palco_atracao.dart';

class Palco extends ManagedObject<_Palco> implements _Palco {
}

//palcos
@Table(name: "palcos")
class _Palco {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String nome;

  @Column(unique: false,nullable: true)
  String descricao;

  @Column(unique: false,nullable: true)
  String imagem;

  @Column(unique: false,nullable: true)
  String video;

  @Column(unique: false,nullable: true)
  String logradouro;

  @Column(unique: false,nullable: true)
  String tipoLogradouro;

  @Column(unique: false,nullable: true)
  String numero;

  @Column(unique: false,nullable: true)
  String bairro;

  ManagedSet<PalcoAtracao> palcoAtracao;

}