import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class ApoiadorFestival extends ManagedObject<_ApoiadorFestival> implements _ApoiadorFestival {}

//Apoiadores do festival
@Table(name: "apoiadoresFestival")
class _ApoiadorFestival {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String nome;

  @Column(unique: false,nullable: true)
  String logo;

  @Column(unique: false,nullable: true)
  String tipo;


}