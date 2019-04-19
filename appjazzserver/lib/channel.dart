//importa os controladores
import 'package:appjazz/controller/attractions_controller.dart';

//importa os modelos
import 'package:appjazz/model/attraction.dart';
import 'package:appjazz/model/already_played_here.dart';
import 'package:appjazz/model/festival_supporter.dart';
import 'package:appjazz/model/food_place.dart';
import 'package:appjazz/model/general_data.dart';
import 'package:appjazz/model/lodging_place.dart';
import 'package:appjazz/model/user.dart';

import 'appjazz.dart';

class AppjazzChannel extends ApplicationChannel {
  //contexto para acesso ao banco de dados
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    //contexto para acesso ao banco de dadosfromCurrentMirrorSystem()
    final dataModel = ManagedDataModel([
      Attraction,
      FestivalSupporter,
      FoodPlace,
      GeneralData,
      LodgingPlace,
      User,
      AlreadyPlayedHere
    ]);

    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "sisadmin", "s1sadm1n", "localhost", 5433, "apps");
    context = ManagedContext(dataModel, persistentStore);
  }

  //define as rotas e vinculas aos controladores
  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    //contexto para acesso ao banco de dados injeção de dependência
    router
        .route("/attractions/[:id]")
        .link(() => AttractionsController(context));

    return router;
  }
}
