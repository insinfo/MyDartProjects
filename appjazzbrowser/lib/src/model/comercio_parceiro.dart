import 'dart:async';
import 'dart:core';

class ComercioParceiro {
  int id;
  String nome;
  String logradouro;
  String tipoLogradouro;
  String numero;
  String telefone1;
  String telefone2;
  String tipoCozinha;
  String tipoComercio;
  String horarioFuncionamento;
  String bairro;
  String imagem;
  String descricao;

  ComercioParceiro(
      {this.id,
      this.nome,
      this.logradouro,
      this.tipoLogradouro,
      this.numero,
      this.telefone1,
      this.telefone2,
      this.tipoCozinha,
      this.tipoComercio,
      this.horarioFuncionamento,
      this.bairro,
      this.imagem,
      this.descricao});

  ComercioParceiro.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.logradouro = json['logradouro'];
    this.tipoLogradouro = json['tipoLogradouro'];
    this.numero = json['numero'];
    this.telefone1 = json['telefone1'];
    this.telefone2 = json['telefone2'];
    this.tipoCozinha = json['tipoCozinha'];
    this.tipoComercio = json['tipoComercio'];
    this.horarioFuncionamento = json['horarioFuncionamento'];
    this.bairro = json['bairro'];
    this.imagem = json['imagem'];
    this.descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = this.id;
    json['nome'] = this.nome;
    json['logradouro'] = this.logradouro;
    json['tipoLogradouro'] = this.tipoLogradouro;
    json['numero'] = this.numero;
    json['telefone1'] = this.telefone1;
    json['telefone2'] = this.telefone2;
    json['tipoCozinha'] = this.tipoCozinha;
    json['tipoComercio'] = this.tipoComercio;
    json['horarioFuncionamento'] = this.horarioFuncionamento;
    json['bairro'] = this.bairro;
    json['imagem'] = this.imagem;
    json['descricao'] = this.descricao;
    return json;
  }
}
