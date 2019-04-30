import 'dart:async';
import 'dart:core';
import 'package:appjazz/model/palco.dart';
import 'package:aqueduct/aqueduct.dart';

//importa os modelos
import 'package:appjazz/model/atracao.dart';
import '../model/palco_atracao.dart';

//este controle lista as atrações do festival
class AtracaoController extends ResourceController {
  //contexto para acesso ao banco de dados
  AtracaoController(this.context);

  final ManagedContext context;

  /*Map<String, dynamic> header = {
    "totalRecords": "Bearer "
  };*/

  //obtem todas atrações
  @Operation.get()
  Future<Response> getAll(
      {@Bind.query('offset') int offset = -1,
      @Bind.query('limit') int limit = -1,
      @Bind.query('search') String search = ""}) async {
    final query = Query<Atracao>(context);

    query.join(set: (a) => a.palcoAtracao).join(object: (pa) => pa.palco);

    if (search != null && search != "") {
      query.predicate =
          QueryPredicate("t0.nome ilike @nome", {"nome": "%${search}%"});
    }

    final totalRecords = await query.reduce.count();
    query.sortBy((a) => a.nome, QuerySortOrder.ascending);

    if (offset != -1 && limit != -1) {
      query.fetchLimit = limit;
      query.offset = offset;
    }

    final attractions = await query.fetch();

    for (Atracao a in attractions) {
      final palcos = a.palcoAtracao.map((t) {
        final palco = t.palco.asMap();
        palco['data'] = t.data.toString();
        palco['selected'] = true;
        return palco;
      }).toList();
      a.palcos = palcos;
      a.backing.removeProperty("palcoAtracao");
    }

    //await Future.delayed(Duration(seconds: 20));

    return Response.ok(attractions, headers: {
      "total-records": totalRecords,
      "Access-Control-Expose-Headers": "*"
    });
  }

  //obtem uma atração por id
  @Operation.get('id')
  Future<Response> getById(@Bind.path('id') int id) async {
    final query = Query<Atracao>(context)
      ..where((attraction) => attraction.id).equalTo(id);

    query.join(set: (a) => a.palcoAtracao).join(object: (pa) => pa.palco);

    final a = await query.fetchOne();

    final palcos = a.palcoAtracao.map((t) {
      final palco = t.palco.asMap();
      palco['data'] = t.data.toString();
      palco['selected'] = true;
      return palco;
    }).toList();

    a.palcos = palcos;
    a.backing.removeProperty("palcoAtracao");

    if (a == null) {
      return Response.notFound();
    }
    return Response.ok(a);
  }

  //cria uma atração
  @Operation.post()
  Future<Response> create(@Bind.body() Atracao inAtracao) async {
    final qAtracao = Query<Atracao>(context)..values = inAtracao;
    final insertedAtracao = await qAtracao.insert();

    //insere
    if (inAtracao.palcos != null) {
      for (var json in inAtracao.palcos) {
        final qPalcoAtracao = Query<PalcoAtracao>(context)
          ..values.palco = Palco.fromJson(json)
          ..values.atracao = insertedAtracao
          ..values.data = DateTime.tryParse(json['data'].toString());

        final palcoAtracao = await qPalcoAtracao.insert();
      }
    }

    return Response.ok(insertedAtracao);
  }

  //atualiza atração
  @Operation.put('id')
  Future<Response> updateById(
      @Bind.path('id') int id, @Bind.body() Atracao inAtracao) async {
    final query = Query<Atracao>(context)
      ..where((a) => a.id).equalTo(id)
      ..values = inAtracao;

    final updatedAtracao = await query.updateOne();

    //vinculação
    if (inAtracao.palcos != null) {
      //deleta todas as vinculações desta atração aos palcos
      final paQuery = Query<PalcoAtracao>(context);
      paQuery.where((pa) => pa.atracao.id).equalTo(updatedAtracao.id);
      final paDeletado = await paQuery.delete();

      for (var json in inAtracao.palcos) {
        final newPalco = Palco.fromJson(json);
        paQuery
          ..values.palco = newPalco
          ..values.atracao = updatedAtracao
          ..values.data = DateTime.tryParse(json['data'].toString());
        final palcoAtracao = await paQuery.insert();
      }
    }

    if (updatedAtracao == null) {
      return Response.notFound();
    }

    return Response.ok(updatedAtracao);
  }

//deleta atração
/*@Operation.delete('id')
  Future<Response> deleteById(@Bind.path('id') int id) async {
    final query = Query<Atracao>(context)
      ..where((attraction) => attraction.id).equalTo(id);

    final attraction = await query.delete();
    if (attraction == null) {
      return Response.notFound();
    }
    return Response.ok(attraction);
  }*/

}
