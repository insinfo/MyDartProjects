import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

//importa os modelos
import 'package:appjazz/model/comercio_parceiro.dart';

//este controle lista as atrações do festival
class ComercioParceiroController extends ResourceController {
  //contexto para acesso ao banco de dados
  ComercioParceiroController(this.context);

  final ManagedContext context;

  //obtem todas
  @Operation.get()
  Future<Response> getAll() async {

    final query = Query<ComercioParceiro>(context);
    final totalRecords = (await query.fetch()).length;

    query.sortBy((i) => i.nome, QuerySortOrder.ascending);

    final item = await query.fetch();
    return Response.ok(item,headers:{
      "total-records": totalRecords,
      "Access-Control-Expose-Headers": "total-records"
    });
  }

  //obtem um por id
  @Operation.get('id')
  Future<Response> getById(@Bind.path('id') int id) async {
    final query = Query<ComercioParceiro>(context)
      ..where((i) => i.id).equalTo(id);

    final item = await query.fetchOne();

    if (item == null) {
      return Response.notFound();
    }
    return Response.ok(item);
  }

  //cria um
  @Operation.post()
  Future<Response> create(@Bind.body() ComercioParceiro input) async {
    final query = Query<ComercioParceiro>(context)..values = input;
    final item = await query.insert();
    return Response.ok(item);
  }

  //atualiza um
  @Operation.put('id')
  Future<Response> update(
      @Bind.path('id') int id, @Bind.body() ComercioParceiro input) async {

    final query = Query<ComercioParceiro>(context)
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
  Future<Response> deleteById(@Bind.path('id') int id) async {
    final query = Query<ComercioParceiro>(context)
      ..where((i) => i.id).equalTo(id);

    final item = await query.delete();
    if (item == null) {
      return Response.notFound();
    }
    return Response.ok(item);
  }

}
