import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';

//models
import '../../model/atracao.dart';
import '../../model/palco.dart';

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
    MaterialButtonComponent,
    MaterialSelectComponent,
    MaterialSelectItemComponent,
    MaterialCheckboxComponent,
    AutoDismissDirective,
    AutoFocusDirective,
    MaterialIconComponent,
    MaterialButtonComponent,
    MaterialTooltipDirective,
    MaterialDialogComponent,
    ModalComponent,
    displayNameRendererDirective,
  ],
  pipes: [commonPipes, TruncatePipe],
  providers: [ClassProvider(AppService),overlayBindings],
  styleUrls: const ['atracao_form_component.css'], //scss
)
class AtracaoFormComponent implements OnActivate {
  @ViewChild('toastElement')
  MdToast toastElement;

  /*final SelectionModel<String> sinlePalcoSelection =
      new SelectionModel.single();
  final SelectionModel<Palco> multiPalcoSelection = new SelectionModel.multi();
  String proto;
  static var palcoList = [
    Palco(nome: "Costazul"),
    Palco(nome: "Lagoa"),
  ];
  List<Palco> get palcos => palcoList;
  final SelectionOptions<Palco> palcoOptions =
      new SelectionOptions.fromList(palcoList);*/

  /* @Input()*/
  Atracao atracao;
  AppService _appService;
  Location _location;
  RList<Palco> palcos;
  int idAtracao;
  bool showPalcoDialog = false;

  AtracaoFormComponent(AppService appService, Location location) {
    this._appService = appService;
    this._location = location;
  }

  @override
  void onActivate(_, RouterState current) async {
    /*if (AppService.objectTransfer is Atracao &&
        AppService.objectTransfer != null) {
      this.atracao = AppService.objectTransfer;
      idAtracao = this.atracao.id;
    } else {*/
    idAtracao = getId(current.parameters);
    if (idAtracao != null) {
      var r = await _appService.getAtracaoById(idAtracao);
      if (r != null) {
        this.atracao = r;
      }
    }else{
      this.atracao = new Atracao();
    }
    this.palcos = await _appService.getAllPalcos();

  }


  Future<void> save() async {
    var message = "";
    if (idAtracao != null) {
      message = await _appService.updateAtracao(this.atracao);
      this.toastElement.showToast(message, type: ToastType.success);
    } else {
      message = await _appService.createAtracao(this.atracao);
      this.toastElement.showToast(message, type: ToastType.success);
    }
    //await Future.delayed(const Duration(milliseconds: 1000));
    //goBack();
  }

  void goBack() => _location.back();

  void addPalco(Palco inpc){
    var pc = new Palco.fromJson(inpc.toJson());
    if(this.atracao != null ) {
      if(this.atracao.palcos != null) {
        this.atracao.palcos.add(pc);
      }else{
        this.atracao.palcos = new RList<Palco>();
        this.atracao.palcos.add(pc);
      }
    }
    showPalcoDialog = false;
  }

  void delPalco(Palco pc){
    if(this.atracao != null ) {
      if(this.atracao.palcos != null) {
        this.atracao.palcos.remove(pc);
      }
    }
  }
}
