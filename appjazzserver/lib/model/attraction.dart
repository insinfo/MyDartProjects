import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class Attraction extends ManagedObject<_Attraction> implements _Attraction {}

@Table(name: "attractions")
class _Attraction {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String name;

  @Column(unique: false,nullable: true)
  String description;

  @Column(unique: false,nullable: true)
  int year;

  @Column(unique: false,nullable: true)
  DateTime date;

  @Column(unique: false,nullable: true)
  String picture;

  @Column(unique: false,nullable: true)
  String video;

  @Column(unique: false,nullable: true)
  String media;

}