import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'src/services/attraction_service.dart';
import 'src/model/attraction.dart';
import 'src/components/attractions_list_component.dart';
import 'src/components/attractions_form_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [AttractionsListComponent, AttractionsFormComponent,
  formDirectives, coreDirectives],
  providers: [ClassProvider(AttractionService)],
)
class AppComponent {
  final title = 'Atrações';

}
