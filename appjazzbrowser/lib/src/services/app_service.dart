import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/browser_client.dart';

import 'package:angular/core.dart';

//models
import '../model/usuario.dart';
import '../model/atracao.dart';
import '../model/palco.dart';
import '../model/comercio_parceiro.dart';
import '../model/apoiador_festival.dart';
import '../model/ja_passou_aqui.dart';
import '../model/dado_generico.dart';

import '../components/data_table_component/response_list.dart';
import '../components/data_table_component/data_table_filter.dart';

@Injectable()
class AppService {
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Authorization":
        "Bearer " + window.localStorage["YWNjZXNzX3Rva2Vu"].toString()
  };

  static Object objectTransfer;

  String apiDomain = "localhost:8888";
  BrowserClient client = new BrowserClient();

  ///********************* ATRAÇOES *****************************/

  Future<RList<Atracao>> getAllAtracoes({DataTableFilter filters}) async {
    try {
      var apiPath = "/atracoes";
      Uri url = new Uri.http(apiDomain, apiPath);
      if (filters != null) {
        url = new Uri.http(apiDomain, apiPath, filters.getParams());
      }

      var list = new RList<Atracao>();
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json != null) {
          var totalReH = response.headers['total-records'];
          var totalRecords = totalReH != null ? int.parse(totalReH) : 0;
          list.totalRecords = totalRecords;
          json.forEach((v) {
            var item = new Atracao.fromJson(v);
            list.add(item);
          });
        }
      }
      return list;
    } catch (e) {
      print("getAllAtracoes: " + e.toString());
      return null;
    }
  }

  Future<Atracao> getAtracaoById(int id) async {
    try {
      var apiPath = "/atracoes/${id}";
      Map<String, String> stringParams = {};
      Uri url = new Uri.http(apiDomain, apiPath);

      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        Atracao result;
        var json = jsonDecode(response.body);
        if (json != null) {
          result = new Atracao.fromJson(json);
        }
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print("getAtracaoById: " + e.toString());
      return null;
    }
  }

  Future<String> updateAtracao(Atracao atracao) async {
    try {

      var apiPath = "/atracoes/${atracao.id}";

      Map<String, String> stringParams = {};

      Uri url = new Uri.http(apiDomain, apiPath);
      var amap = atracao.toJson();

      print(jsonEncode(amap));

      var resp = await client.put(url,
          body: jsonEncode(amap),
          encoding: Utf8Codec(),
          headers: headers);

      if (resp.statusCode == 200) {
        return "Salvo com sucesso.";
      }

      return "Falha: ${resp.body}";
    } catch (e) {
      print("updateAtracao: " + e.toString());
      return "Falha: " + e.toString();
    }
  }

  Future<String> createAtracao(Atracao atracao) async {
    try {
      var apiPath = "/atracoes";
      Map<String, String> stringParams = {};
      Uri url = new Uri.http(apiDomain, apiPath);

      var resp = await client.post(url,
          body: jsonEncode(atracao.toJson()),
          encoding: Utf8Codec(),
          headers: headers);

      if (resp.statusCode == 200) {
        return "Salvo com sucesso.";
      }

      return "Falha: ${resp.body}";
    } catch (e) {
      print("createAtracao: " + e.toString());
      return "Falha: " + e.toString();
    }
  }

  Future<String> deleteAllAtracao(RList<Atracao> atracao) async {
    try {
      var apiPath = "/atracoes";
      Map<String, String> stringParams = {};
      Uri url = new Uri.http(apiDomain, apiPath);

      List<Map<String,dynamic>> dataToSend = atracao.map((t) => t.toJson()).toList();

      HttpRequest request = new HttpRequest();
      request
      ..open("delete", url.toString())
      ..setRequestHeader('Content-Type','application/json')
      ..send(json.encode(dataToSend));

      await request.onLoadEnd.first;
      //await request.onReadyStateChange.first;
      if (request.status == 200) {
        return "Sucesso.";
      }

      return "Falha: ${request.responseText}";

    } catch (e) {
      print("deleteAllAtracao: " + e.toString());
      return "Falha: " + e.toString();
    }
  }

  ///********************* PALCOS *****************************/

  Future<RList<Palco>> getAllPalcos({DataTableFilter filters}) async {
    try {
      var apiPath = "/palcos";
      Uri url = new Uri.http(apiDomain, apiPath);
      if (filters != null) {
        url = new Uri.http(apiDomain, apiPath, filters.getParams());
      }

      var list = new RList<Palco>();
      var resp = await client.get(url, headers: headers);
      if (resp.statusCode == 200) {
        //var items = (JSON.decode(resp .body) as List).map((e) => new Palco.fromJson(e)).toList();
        List json = jsonDecode(resp.body);
        if (json != null) {
          var totalReH = resp.headers['total-records'];
          var totalRecords = totalReH != null ? int.parse(totalReH) : 0;
          list.totalRecords = totalRecords;
          json.forEach((v) {
            var item = new Palco.fromJson(v);
            list.add(item);
          });
        }
      }
      return list;
    } catch (e) {
      print("getAllPalcos: " + e.toString());
      return null;
    }
  }

  Future<String> updatePalco(Palco palco) async {
    try {
      var apiPath = "/palcos";
      Map<String, String> stringParams = {};
      Uri url = new Uri.http(apiDomain, apiPath);

      var resp = await client.put(url,
          body: jsonEncode(palco.toJson()),
          encoding: Utf8Codec(),
          headers: headers);

      if (resp.statusCode == 200) {
        return "Sucesso";
      }
      return "Falha";
    } catch (e) {
      print("updatePalco: " + e.toString());
      return "Falha";
    }
  }

/*Future apiCall([Map params = const {}]) async {
    loading = true;
    Map stringParams = {};
    params.forEach((k,v)=>stringParams[k.toString()] = v.toString());
    Uri url = new Uri.http(apiDomain, apiPath, stringParams);
    print(url);
    var result = await http.post(
        url,
        body: {'apikey': apiKey}
    );
    loading = false;
    print(result.body);
    return json.decode(result.body);
  }*/
}
