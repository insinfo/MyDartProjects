import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class FoodPlace extends ManagedObject<_FoodPlace> implements _FoodPlace {}

@Table(name: "foodPlaces")
class _FoodPlace {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String name;

  @Column(unique: false,nullable: true)
  String address;

  @Column(unique: false,nullable: true)
  String addressType;

  @Column(unique: false,nullable: true)
  String number;

  @Column(unique: false,nullable: true)
  String phone1;

  @Column(unique: false,nullable: true)
  String phone2;

  @Column(unique: false,nullable: true)
  String cuisineType;

  @Column(unique: false,nullable: true)
  String placeType;

  @Column(unique: false,nullable: true)
  String openingHours;

  @Column(unique: false,nullable: true)
  String neighborhood;

  @Column(unique: false,nullable: true)
  String picture;

  @Column(unique: false,nullable: true)
  String description;

}