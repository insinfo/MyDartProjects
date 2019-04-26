import 'dart:async';
import 'dart:html';
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
  //forma de acessar o elemento por id
  /*@ViewChild("alertOutlet")
  DivElement element;*/

  static String alertOutlet;

  static showAlert(String ms) {
    alertOutlet = ms;
    Timer _timer;
    _timer?.cancel();
    _timer = new Timer(Duration(milliseconds: 2500), () {
      alertOutlet = null;
    });
  }

  final title = 'Administração App Jazz&Blues';
}
