import 'package:angular_router/angular_router.dart';

import './route_paths.dart';
//componentes
import 'components/atracao_list_component/atracao_list_component.template.dart' as atracao_list_template;

//import 'todo_list/todo_list_component.dart' as todo_list_template;

export 'route_paths.dart';

//rotas
class Routes {

 static final atracoes = RouteDefinition(
    routePath: RoutePaths.atracoes,
    component: atracao_list_template.AtracaoListComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    atracoes
  ];

}