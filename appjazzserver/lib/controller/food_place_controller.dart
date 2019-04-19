import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

//importa os modelos
import 'package:appjazz/model/food_place.dart';

//este controle lista as atrações do festival
class FoodPlaceController extends ResourceController {
  //contexto para acesso ao banco de dados
  FoodPlaceController(this.context);

  final ManagedContext context;

  //obtem todas
  @Operation.get()
  Future<Response> getAllFoodPlaces() async {
    final query = Query<FoodPlace>(context)
      ..sortBy((i) => i.name, QuerySortOrder.ascending);

    final item = await query.fetch();
    return Response.ok(item);
  }

  //obtem um por id
  @Operation.get('id')
  Future<Response> getFoodPlaceByID(@Bind.path('id') int id) async {
    final query = Query<FoodPlace>(context)
      ..where((i) => i.id).equalTo(id);

    final item = await query.fetchOne();

    if (item == null) {
      return Response.notFound();
    }
    return Response.ok(item);
  }

  //cria um
  @Operation.post()
  Future<Response> createFoodPlace(@Bind.body() FoodPlace input) async {
    final query = Query<FoodPlace>(context)..values = input;
    final item = await query.insert();
    return Response.ok(item);
  }

  //atualiza um
  @Operation.put('id')
  Future<Response> updateHeroById(
      @Bind.path('id') int id, @Bind.body() FoodPlace input) async {

    final query = Query<FoodPlace>(context)
      ..where((i) => i.id).equalTo(id)
      ..values = input;

    final item = await query.updateOne();

    if (item == null) {
      return Response.notFound();
    }

    return Response.ok(item);
  }

  //deleta um
  @Operation.delete('id')
  Future<Response> deleteHeroByID(@Bind.path('id') int id) async {
    final query = Query<FoodPlace>(context)
      ..where((i) => i.id).equalTo(id);

    final item = await query.delete();
    if (item == null) {
      return Response.notFound();
    }
    return Response.ok(item);
  }

}
