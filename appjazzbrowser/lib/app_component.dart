import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'src/route_paths.dart';
import 'src/routes.dart';

import 'src/services/app_service.dart';

import 'src/components/atracao_list_component/atracao_list_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    formDirectives,
    coreDirectives,
    routerDirectives,
    AtracaoListComponent
  ],
  providers: [ClassProvider(AppService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'Administração App Jazz&Blues';

}
