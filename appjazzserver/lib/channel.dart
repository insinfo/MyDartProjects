//importa os controladores

import 'package:appjazz/controller/apoidor_festival_controller.dart';
import 'package:appjazz/controller/atracao_controller.dart';
import 'package:appjazz/controller/comercio_parceiro_controller.dart';
import 'package:appjazz/controller/dado_generico_controller.dart';
import 'package:appjazz/controller/ja_passou_aqui_controller.dart';
import 'package:appjazz/controller/usuario_controller.dart';
import 'package:appjazz/controller/palco_controller.dart';

//importa os modelos
import 'package:appjazz/model/atracao.dart';
import 'package:appjazz/model/ja_passou_aqui.dart';
import 'package:appjazz/model/apoiador_festival.dart';
import 'package:appjazz/model/comercio_parceiro.dart';
import 'package:appjazz/model/dado_generico.dart';
import 'package:appjazz/model/usuario.dart';
import 'package:appjazz/model/palco_atracao.dart';
import 'package:appjazz/model/palco.dart';
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
      Atracao,
      ApoiadorFestival,
      ComercioParceiro,
      DadoGenerico,
      Usuario,
      JaPassouAqui,
      Palco,
      PalcoAtracao,
    ]);

    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "postgres", "s1sadm1n", "localhost", 5433, "apps");
    context = ManagedContext(dataModel, persistentStore);
  }

  //define as rotas e vinculas aos controladores
  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    //contexto para acesso ao banco de dados, injeção de dependência

    router
        .route("/apoiadores/[:id]")
        .link(() => ApoiadorFestivalController(context));

    router.route("/atracoes/[:id]")
        .link(() => AtracaoController(context));

    router.route("/palcos/[:id]")
        .link(() => PalcoController(context));

    router
        .route("/comercios/[:id]")
        .link(() => ComercioParceiroController(context));

    router.route("/dados/[:id]").link(() => DadoGenericoController(context));

    router
        .route("/passaramaqui/[:id]")
        .link(() => JaPassouAquiController(context));

    router.route("/usuarios/[:id]").link(() => UsuarioController(context));

/*

     Handles any route that starts with /file/
     router
        .route("/file/*")
        .link(() => FileController());

    @Operation.get()
    Future<Response> getAllProjects(
        @Bind.header("x-client-id") String clientId,
        {@Bind.query("limit") int limit: 10}) async {
      // GET /projects
      return Response.ok();
    } */
 */

    return router;
  }
}
