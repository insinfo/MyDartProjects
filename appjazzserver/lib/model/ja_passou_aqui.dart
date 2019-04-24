import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class JaPassouAqui extends ManagedObject<_jaPassouAqui>
    implements _jaPassouAqui {}


//JÁ PASSARAM POR AQUI
@Table(name: "jaPassaramAqui")
class _jaPassouAqui {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String nome;

  @Column(unique: false,nullable: true)
  DateTime data;

  //descrição
  @Column(unique: false,nullable: true)
  String descricao;
}
