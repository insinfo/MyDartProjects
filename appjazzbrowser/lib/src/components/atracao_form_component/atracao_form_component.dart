import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';

//models
import '../../model/atracao.dart';

//serviços
import '../../services/app_service.dart';

//pipes
import '../../truncate_pipe.dart';

//helpers
import '../data_table_component/response_list.dart';

//components
import '../md_toast_component/md_toast_component.dart';
import '../../../app_component.dart';
//
import '../../route_paths.dart';

@Component(
  selector: 'atracao-form',
  //isto vai ser o nome da tag do componente
  styles: [''],
  templateUrl: 'atracao_form_component.html',
  directives: [
    formDirectives,
    coreDirectives,
    routerDirectives,
    MdToast,
    MaterialButtonComponent
  ],
  pipes: [commonPipes, TruncatePipe],
  providers: [ClassProvider(AppService)],
)
class AtracaoFormComponent implements OnActivate {
  @ViewChild('toastElement')
  MdToast toastElement;

  /*@ViewChild("alert")
  DivElement element;*/

  /* @Input()*/
  Atracao atracao;

  AppService _appService;
  Location _location;

  AtracaoFormComponent(AppService appService, Location location) {
    this._appService = appService;
    this._location = location;
  }

  @override
  void onActivate(_, RouterState current) async {
    if (AppService.objectTransfer is Atracao) {
      this.atracao = AppService.objectTransfer;
    } else {
      final id = getId(current.parameters);
      if (id != null) this.atracao = await (_appService.getAtracaoById(id));
    }
  }

  Future<void> save() async {
    //await _appService.update(atracao);
    this.toastElement.showToast("Salvo com sucesso.", type: ToastType.success);
   // AppComponent.showAlert("Salvo com sucesso.");
    //Future.delayed(const Duration(seconds: 2),()=>{goBack();});
    await Future.delayed(const Duration(milliseconds: 2500)); //recommend
    goBack();
  }

  void goBack() => _location.back();
}
