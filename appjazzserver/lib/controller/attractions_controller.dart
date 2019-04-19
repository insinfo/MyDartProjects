import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

//importa os modelos
import 'package:appjazz/model/attraction.dart';

//este controle lista as atrações do festival
class AttractionsController extends ResourceController {
  //contexto para acesso ao banco de dados
  AttractionsController(this.context);

  final ManagedContext context;

  //obtem todas atrações
  @Operation.get()
  Future<Response> getAllAttractions() async {
    final query = Query<Attraction>(context)
      ..sortBy((attraction) => attraction.name, QuerySortOrder.ascending);

    final attractions = await query.fetch();
    return Response.ok(attractions);
  }

  //obtem uma atração por id
  @Operation.get('id')
  Future<Response> getAttractionByID(@Bind.path('id') int id) async {
    final query = Query<Attraction>(context)
      ..where((attraction) => attraction.id).equalTo(id);

    final attraction = await query.fetchOne();

    if (attraction == null) {
      return Response.notFound();
    }
    return Response.ok(attraction);
  }

  //cria uma atração
  @Operation.post()
  Future<Response> createAttraction(
      @Bind.body() Attraction inputAttraction) async {
    final query = Query<Attraction>(context)..values = inputAttraction;
    final insertedAttraction = await query.insert();
    return Response.ok(insertedAttraction);
  }

  //atualiza atração
  @Operation.put('id')
  Future<Response> updateHeroById(
      @Bind.path('id') int id, @Bind.body() Attraction inputAttraction) async {
    final query = Query<Attraction>(context)
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
  Future<Response> deleteHeroByID(@Bind.path('id') int id) async {
    final query = Query<Attraction>(context)
      ..where((attraction) => attraction.id).equalTo(id);

    final attraction = await query.delete();
    if (attraction == null) {
      return Response.notFound();
    }
    return Response.ok(attraction);
  }

}
