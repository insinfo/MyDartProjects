import 'dart:async';
import 'dart:core';
import '../components/data_table_component/serialization_interface.dart';
class Usuario implements ISerialization{
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
    if(this.id != null) {
      json['id'] = this.id;
    }
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

  List<Map<String, dynamic>> toDisplayNames() {
    var list = new List<Map<String, dynamic>>();
    list.add({"key":"id","type":"number","title":"Id"});
    list.add({"key":"nome","type":"string","limit":60,"title":"Nome"});
    list.add({"key":"telefone","type":"string","title":"Telefone"});
    list.add({"key":"cpf","type":"cpf","title":"CPF"});
    list.add({"key":"email","type":"email","title":"Email"});
    list.add({"key":"dataNascimento","type":"date","title":"Nascimento"});
    list.add({"key":"sexo","type":"string","title":"Sexo"});
    list.add({"key":"registradoEm","type":"date","title":"Registrado"});
    return list;
  }
}
