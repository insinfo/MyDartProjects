import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class User extends ManagedObject<_User> implements _User {}

@Table(name: "users")
class _User {
  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false)
  String name;

  @Column(unique: false)
  String phone;

  @Column(unique: false)
  String cpf;

  @Column(unique: false)
  String email;

  @Column(unique: false)
  String birth;

  @Column(unique: false)
  String sex;

  @Column(unique: false)
  String pass;

  @Column(unique: false)
  DateTime registeredAt;
}
