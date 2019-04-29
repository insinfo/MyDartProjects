import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

//importa os modelos
import 'package:appjazz/model/atracao.dart';

//este controle lista as atrações do festival
class AtracoesController extends ResourceController {
  //contexto para acesso ao banco de dados
  AtracoesController(this.context);

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

    if (search != null && search != "") {
      query.predicate =
          QueryPredicate("nome ilike @nome", {"nome": "%${search}%"});
    }

    final totalRecords = await query.reduce.count();

    query.sortBy((attraction) => attraction.nome, QuerySortOrder.ascending);

    if (offset != -1 && limit != -1) {
      query.fetchLimit = limit;
      query.offset = offset;
    }

    final attractions = await query.fetch();

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

    final attraction = await query.fetchOne();

    if (attraction == null) {
      return Response.notFound();
    }
    return Response.ok(attraction);
  }

  //cria uma atração
  @Operation.post()
  Future<Response> create(@Bind.body() Atracao inputAttraction) async {
    final query = Query<Atracao>(context)..values = inputAttraction;
    final insertedAttraction = await query.insert();
    return Response.ok(insertedAttraction);
  }

  //atualiza atração
  @Operation.put('id')
  Future<Response> updateById(
      @Bind.path('id') int id, @Bind.body() Atracao inputAttraction) async {
    final query = Query<Atracao>(context)
      ..where((attraction) => attraction.id).equalTo(id)
      ..values = inputAttraction;

    final attraction = await query.updateOne();

    if (attraction == null) {
      return Response.notFound();
    }

    return Response.ok(attraction);
  }

  //deleta atração
  @Operation.delete('id')
  Future<Response> deleteById(@Bind.path('id') int id) async {
    final query = Query<Atracao>(context)
      ..where((attraction) => attraction.id).equalTo(id);

    final attraction = await query.delete();
    if (attraction == null) {
      return Response.notFound();
    }
    return Response.ok(attraction);
  }
}
