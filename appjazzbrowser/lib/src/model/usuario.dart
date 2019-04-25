import 'dart:async';
import 'dart:core';

class Usuario {
  int id;
  String nome;
  String telefone;
  String cpf;
  String email;
  String dataNascimento;
  String sexo;
  String pass;
  DateTime registradoEm;

  Usuario(
      {this.id,
      this.nome,
      this.telefone,
      this.cpf,
      this.email,
      this.dataNascimento,
      this.sexo,
      this.pass,
      this.registradoEm});

  Usuario.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.telefone = json['telefone'];
    this.cpf = json['cpf'];
    this.email = json['email'];
    this.dataNascimento = json['dataNascimento'];
    this.sexo = json['sexo'];
    this.pass = json['pass'];
    this.registradoEm = DateTime.parse(json['registradoEm']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = this.id;
    json['nome'] = this.nome;
    json['telefone'] = this.telefone;
    json['cpf'] = this.cpf;
    json['email'] = this.email;
    json['dataNascimento'] = this.dataNascimento;
    json['sexo'] = this.sexo;
    json['pass'] = this.pass;
    json['registradoEm'] = this.registradoEm;
    return json;
  }
}
