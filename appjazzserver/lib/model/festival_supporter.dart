import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class FestivalSupporter extends ManagedObject<_FestivalSupporter> implements _FestivalSupporter {}

@Table(name: "festivalSupporters")
class _FestivalSupporter {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String name;

  @Column(unique: false,nullable: true)
  String logo;

  @Column(unique: false,nullable: true)
  String type;


}