import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class GeneralData extends ManagedObject<_GeneralData> implements _GeneralData {}

@Table(name: "generalData")
class _GeneralData {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String history;

  @Column(unique: false,nullable: true)
  String stages;

  @Column(unique: false,nullable: true)
  int editions;

  @Column(unique: false,nullable: true)
  String logo;

}