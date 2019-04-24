import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class Usuario extends ManagedObject<_Usuario> implements _Usuario {}

@Table(name: "usuarios")
class _Usuario {
  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false)
  String nome;

  @Column(unique: false)
  String telefone;

  @Column(unique: false)
  String cpf;

  @Column(unique: false)
  String email;

  @Column(unique: false)
  String dataNascimento;

  @Column(unique: false)
  String sexo;

  @Column(unique: false)
  String pass;

  @Column(unique: false)
  DateTime registradoEm;
}
