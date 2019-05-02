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
import '../data_table_component/response_list.dart';
import '../data_table_component/data_table_filter.dart';

//components
import '../atracao_form_component/atracao_form_component.dart';
import '../data_table_component/data_table_component.dart';
import '../md_toast_component/md_toast_component.dart';

//rotas
import '../../route_paths.dart';
import '../../routes.dart';

@Component(
  //isto vai ser o nome da tag do componente
  selector: 'atracao-list',
  styles: [''],
  templateUrl: 'atracao_list_component.html',
  directives: [
    formDirectives,
    coreDirectives,
    MdToast,
    routerDirectives,
    AtracaoFormComponent,
    DataTableComponent
  ],
  pipes: [commonPipes, TruncatePipe],
  providers: [ClassProvider(AppService)],
  exports: [RoutePaths, Routes],
)
class AtracaoListComponent implements OnInit {
  @ViewChild('dataTable')
  DataTableComponent dataTable;

  @ViewChild('toastElement')
  MdToast toastElement;

  RList<Atracao> atracoes;
  Atracao selected;
  Router _router;
  AppService _appService;

  AtracaoListComponent(AppService appService, Router router) {
    this._appService = appService;
    this._router = router;
  }

  Future<void> _getAllAtracoes({DataTableFilter filters}) async {
    this.atracoes = await _appService.getAllAtracoes(filters: filters);
  }

  /*void _getAllAtracoes() {
    _appService.getAllAtracoes().then((atracoes) => this.atracoes = atracoes);
  }*/

  String atracaoUrl(int id) =>
      RoutePaths.atracaoEdit.toUrl(parameters: {'id': '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(atracaoUrl(selected.id));

  void onRowClick(Atracao sel) {
    this.selected = sel;
    AppService.objectTransfer = this.selected;
    gotoDetail();
  }

  Future<void> onRequestData(DataTableFilter dataTableFilter) async {
    await _getAllAtracoes(filters: dataTableFilter);
  }

  Future<void> onDelete() async {
    if (dataTable.selectedItems != null && dataTable.selectedItems.isNotEmpty) {
      RList<Atracao> list = new RList<Atracao>();
      for (Atracao a in dataTable.selectedItems) {
        list.add(a);
      }
      var message = await _appService.deleteAllAtracao(list);
      this.toastElement.showToast(message, type: ToastType.success);
      await _getAllAtracoes(filters: new DataTableFilter());
    }
  }

  void ngOnInit() => _getAllAtracoes(filters: new DataTableFilter());
}
