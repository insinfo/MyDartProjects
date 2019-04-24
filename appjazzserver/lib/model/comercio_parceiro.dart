import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

class ComercioParceiro extends ManagedObject<_ComercioParceiro> implements _ComercioParceiro {}

@Table(name: "comerciosParceiro")
class _ComercioParceiro {

  @Column(primaryKey: true,unique: true,autoincrement:true, databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Column(unique: false,nullable: true)
  String nome;

  @Column(unique: false,nullable: true)
  String logradouro;

  @Column(unique: false,nullable: true)
  String tipoLogradouro;

  @Column(unique: false,nullable: true)
  String numero;

  @Column(unique: false,nullable: true)
  String telefone1;

  @Column(unique: false,nullable: true)
  String telefone2;

  @Column(unique: false,nullable: true)
  String tipoCozinha;

  @Column(unique: false,nullable: true)
  String tipoComercio;

  @Column(unique: false,nullable: true)
  String horarioFuncionamento;

  @Column(unique: false,nullable: true)
  String bairro;

  @Column(unique: false,nullable: true)
  String imagem;

  @Column(unique: false,nullable: true)
  String descricao;

}