import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

//models
import '../../model/atracao.dart';

//serviços
import '../../services/app_service.dart';

//pipes
import '../../truncate_pipe.dart';

//helpers
import '../../response_list.dart';

//components
import '../atracao_form_component/atracao_form_component.dart';
import '../../route_paths.dart';

@Component(
  //isto vai ser o nome da tag do componente
  selector: 'atracao-list',
  styles: [''],
  templateUrl: 'atracao_list_component.html',
  directives: [
    formDirectives,
    coreDirectives,
    routerDirectives,
    AtracaoFormComponent
  ],
  pipes: [commonPipes, TruncatePipe],
  providers: [ClassProvider(AppService)],
)
class AtracaoListComponent implements OnInit {
  RList<Atracao> atracoes;
  Atracao selected;
  Router _router;
  AppService _appService;

  AtracaoListComponent(AppService appService, Router router) {
    this._appService = appService;
    this._router = router;
  }

  Future<void> _getAllAtracoes() async {
    this.atracoes = await _appService.getAllAtracoes();
  }

  String atracaoUrl(int id) =>
      RoutePaths.atracao.toUrl(parameters: {'id': '$id'});

  /*void _getAttractions() {
    _attractionService.getAll().then((attractions) => this._attractions = attractions);
  }*/

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(atracaoUrl(selected.id));

  void onSelect(Atracao sel) {
    this.selected = sel;
    AppService.objectTransfer = this.selected;
  }

  void ngOnInit() => _getAllAtracoes();
}
