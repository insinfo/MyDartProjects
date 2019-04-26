import 'package:angular_router/angular_router.dart';

class RoutePaths {
  static final atracoes = RoutePath(path: 'atracoes');
  static final atracao = RoutePath(path: '${atracoes.path}/:id');
}

int getId(Map<String, String> parameters) {
  final id = parameters['id'];
  return id == null ? null : int.tryParse(id);
}