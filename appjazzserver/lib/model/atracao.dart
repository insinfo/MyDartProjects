import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class Atracao extends ManagedObject<_Atracao> implements _Atracao {

  /*@Serialize()
  int teste =0; // included in asMap, read in read

  @Serialize(input: true, output: false)
  int c =2; // NOT included in asMap, read in read

  @Serialize(input: false, output: true)
  int d=3; // included in asMap, NOT read in read

  @Serialize()
  String get transientValue => "dff";*/
}

//atrações
@Table(name: "atracoes")
class _Atracao {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String nome;

  @Column(unique: false,nullable: true)
  String descricao;

  @Column(unique: false,nullable: true)
  int ano;

  @Column(unique: false,nullable: true)
  DateTime data;

  @Column(unique: false,nullable: true)
  String imagem;

  @Column(unique: false,nullable: true)
  String video;

  @Column(unique: false,nullable: true)
  String media;


}