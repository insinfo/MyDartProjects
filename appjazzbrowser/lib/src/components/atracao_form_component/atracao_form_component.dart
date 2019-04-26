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

//
import '../../route_paths.dart';

@Component(
  selector: 'atracao-form',//isto vai ser o nome da tag do componente
  styles: [''],
  templateUrl: 'atracao_form_component.html',
  directives: [
    formDirectives,
    coreDirectives,
    routerDirectives
  ],
  pipes: [commonPipes, TruncatePipe],
  providers: [ClassProvider(AppService)],
)

class AtracaoFormComponent  implements OnActivate{
 /* @Input()*/
  Atracao atracao = new Atracao(nome: "",id:0);

   AppService _appService;
   Location _location;

  AtracaoFormComponent(AppService appService,Location location){
    this._appService = appService;
    this._location = location;

  }

  @override
  void onActivate(_, RouterState current) async {
    //final id = getId(current.parameters);
    //if (id != null) atracao = await (_appService.get(id));
    this.atracao = AppService.objectTransfer;
    print(this.atracao.nome);
  }

  Future<void> save() async {
    //await _appService.update(atracao);
    goBack();
  }

  void goBack() => _location.back();

}
