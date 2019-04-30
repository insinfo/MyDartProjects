import 'package:angular_router/angular_router.dart';

class RoutePaths {
  static final atracoes = RoutePath(path: 'atracoes');
  static final atracaoEdit = RoutePath(path: '${atracoes.path}/edit/:id');
  static final atracaoNew = RoutePath(path: '${atracoes.path}/new');

  static final palcos = RoutePath(path: 'palcos');
  static final palcoEdit = RoutePath(path: '${palcos.path}/edit/:id');
  static final palcoNew = RoutePath(path: '${palcos.path}/new');

}

int getId(Map<String, String> parameters) {
  final id = parameters['id'];
  return id == null ? null : int.tryParse(id);
}

String getParam(Map<String, String> parameters,String paramName) {
  return parameters[paramName];
}