import 'dart:async';
import 'dart:core';
import 'package:appjazz/model/palco.dart';
import 'package:aqueduct/aqueduct.dart';

//importa os modelos
import 'package:appjazz/model/atracao.dart';
import '../model/palco_atracao.dart';

//este controle lista os palcos do festival
class PalcoController extends ResourceController {
  //contexto para acesso ao banco de dados
  PalcoController(this.context);

  final ManagedContext context;

  /*Map<String, dynamic> header = {
    "totalRecords": "Bearer "
  };*/

  //obtem todos
  @Operation.get()
  Future<Response> getAll(
      {@Bind.query('offset') int offset = -1,
      @Bind.query('limit') int limit = -1,
      @Bind.query('search') String search = ""}) async {
    final query = Query<Palco>(context);

    query.join(set: (a) => a.palcoAtracao).join(object: (pa) => pa.atracao);

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

    final items = await query.fetch();

    for (Palco p in items) {
      final atracoes = p.palcoAtracao.map((t) {
        final atracao = t.atracao.asMap();
        atracao['data'] = t.data.toString();
        return atracao;
      }).toList();
      p.atracoes = atracoes;
      p.backing.removeProperty("palcoAtracao");
    }

    //await Future.delayed(Duration(seconds: 20));

    return Response.ok(items, headers: {
      "total-records": totalRecords,
      "Access-Control-Expose-Headers": "*"
    });
  }

  //obtem uma atração por id
  @Operation.get('id')
  Future<Response> getById(@Bind.path('id') int id) async {
    final query = Query<Palco>(context)
      ..where((attraction) => attraction.id).equalTo(id);

    query.join(set: (a) => a.palcoAtracao).join(object: (pa) => pa.atracao);

    final p = await query.fetchOne();

    final atracoes = p.palcoAtracao.map((t) {
      final atracao = t.atracao.asMap();
      atracao['data'] = t.data.toString();
      return atracao;
    }).toList();
    p.atracoes = atracoes;
    p.backing.removeProperty("palcoAtracao");


    if (p == null) {
      return Response.notFound();
    }
    return Response.ok(p);
  }

  //cria uma atração
  @Operation.post()
  Future<Response> create(@Bind.body() Palco input) async {
    final query = Query<Palco>(context)..values = input;
    final inserted= await query.insert();

    //insere
    if (input.atracoes != null) {
      for (var json in input.atracoes) {
        final qPalcoAtracao = Query<PalcoAtracao>(context)
          ..values.palco = inserted
          ..values.atracao = Atracao.fromJson(json)
          ..values.data = DateTime.tryParse(json['data'].toString());

        final palcoAtracao = await qPalcoAtracao.insert();
      }
    }

    return Response.ok(inserted);
  }

  //atualiza atração
  @Operation.put('id')
  Future<Response> updateById(
      @Bind.path('id') int id, @Bind.body() Palco input) async {
    final query = Query<Palco>(context)
      ..where((a) => a.id).equalTo(id)
      ..values = input;

    final updated = await query.updateOne();

    //vinculação
    if (input.atracoes != null) {
      //deleta todas as vinculações deste palcos as atração
      final paQuery = Query<PalcoAtracao>(context);
      paQuery.where((pa) => pa.palco.id).equalTo(updated.id);
      final paDeletado = await paQuery.delete();

      for (var json in input.atracoes) {
        final newAtracao = Atracao.fromJson(json);
        paQuery
          ..values.palco = updated
          ..values.atracao = newAtracao
          ..values.data = DateTime.tryParse(json['data'].toString());
        final palcoAtracao = await paQuery.insert();
      }
    }

    if (updated == null) {
      return Response.notFound();
    }

    return Response.ok(updated);
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
