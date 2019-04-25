import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

//models
import '../../model/atracao.dart';

//serviços
import '../../services/app_service.dart';
//pipes
import '../../truncate_pipe.dart';

import '../../response_list.dart';

@Component(
  selector: 'atracao-list',
  //isto vai ser o nome da tag do componente
  styles: [''],
  templateUrl: 'atracao_list_component.html',
  directives: [formDirectives, coreDirectives],
  pipes: [commonPipes,TruncatePipe],
  providers: [ClassProvider(AppService)],
)
class AtracaoListComponent implements OnInit {
  RList<Atracao> atracoes;
  Atracao selected;

  AppService appService;

  AtracaoListComponent(AppService appService) {
    this.appService = appService;
  }

  Future<void> _getAllAtracoes() async {
    atracoes = await appService.getAllAtracoes();
  }

  /*void _getAttractions() {
    _attractionService.getAll().then((attractions) => this._attractions = attractions);
  }*/

  void onSelect(Atracao selected) {
    selected = selected;
    print("onSelect");
  }

  void ngOnInit() => _getAllAtracoes();

}
