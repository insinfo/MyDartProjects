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

  //obtem todas atrações
  @Operation.get()
  Future<Response> getAll() async {
    final query = Query<Atracao>(context)
      ..sortBy((attraction) => attraction.nome, QuerySortOrder.ascending);

    final attractions = await query.fetch();
    return Response.ok(attractions);
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
  Future<Response> create(
      @Bind.body() Atracao inputAttraction) async {
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
