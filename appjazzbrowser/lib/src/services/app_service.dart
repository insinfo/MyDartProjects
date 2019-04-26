import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/browser_client.dart';
import 'package:angular/core.dart';

import '../model/usuario.dart';
import '../model/atracao.dart';
import '../model/comercio_parceiro.dart';
import '../model/apoiador_festival.dart';
import '../model/ja_passou_aqui.dart';
import '../model/dado_generico.dart';

import '../response_list.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class AppService {
  //final attractions = <Attraction>[
  /*final List<Atracao> atracoes = [
    Atracao(id:0,nome: "",descricao: ""),
  ];*/

  //List<Attraction> getAll() => attractions;

  /*Map<String, String> header = {
    //"User-Agent": ,
    "Authorization": "Bearer " + window.localStorage["YWNjZXNzX3Rva2Vu"]
    //access_token
  };*/

  static Object objectTransfer;

  String baseUrl = "http://localhost:8888";
  BrowserClient client = new BrowserClient();

  Future<RList<Atracao>> getAllAtracoes() async {
    try {
      var response = await client.get(baseUrl + "/atracoes");//, headers: header
      if (response.statusCode == 200) {

        var list = new RList<Atracao>();
        var json = jsonDecode(response.body);
        if (json != null) {
          var totalReH = response.headers['total-records'];
          var totalRecords = totalReH != null ? int.parse(totalReH) : 0;
          list.totalRecords =totalRecords;
          json.forEach((v) {
            var item = new Atracao.fromJson(v);
            list.add(item);
          });
        }
        return list;
      } else {
        return null;
      }
    } catch (e) {
      print("getAllAtracoes: " + e.toString());
      return null;
    }
  }
}
