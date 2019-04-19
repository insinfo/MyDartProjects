import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class AlreadyPlayedHere extends ManagedObject<_AlreadyPlayedHere>
    implements _AlreadyPlayedHere {}

@Table(name: "alreadyPlayedHere")
class _AlreadyPlayedHere {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String name;

  @Column(unique: false,nullable: true)
  DateTime date;

  @Column(unique: false,nullable: true)
  String description;
}
