import 'package:angular_router/angular_router.dart';

import './route_paths.dart';
//componentes
import 'components/atracao_list_component/atracao_list_component.template.dart' as atracao_list_template;
import 'components/atracao_form_component/atracao_form_component.template.dart' as atracao_form_template;

//import 'todo_list/todo_list_component.dart' as todo_list_template;

export 'route_paths.dart';

//rotas
class Routes {

 static final atracoes = RouteDefinition(
    routePath: RoutePaths.atracoes,
    component: atracao_list_template.AtracaoListComponentNgFactory,
  );

 static final atracao = RouteDefinition(
   routePath: RoutePaths.atracao,
   component: atracao_form_template.AtracaoFormComponentNgFactory,
 );

  static final all = <RouteDefinition>[
    atracoes,atracao,
    /*RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),*/
  ];

}