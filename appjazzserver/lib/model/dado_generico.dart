import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class DadoGenerico extends ManagedObject<_DadoGenerico> implements _DadoGenerico {}

@Table(name: "dadosGenericos")
class _DadoGenerico {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String historia;

  @Column(unique: false,nullable: true)
  String palcos;

  @Column(unique: false,nullable: true)
  int edicoes;

  @Column(unique: false,nullable: true)
  String logo;

}