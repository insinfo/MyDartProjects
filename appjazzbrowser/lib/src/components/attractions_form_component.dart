import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../services/attraction_service.dart';
import '../model/attraction.dart';

@Component(
  selector: 'attraction-form',//isto vai ser o nome da tag do componente
  styleUrls: ['../../app_component.css'],
  templateUrl: '../templates/attractions_form_component.html',
  directives: [formDirectives,coreDirectives],
  providers: [ClassProvider(AttractionService)],
)

class AttractionsFormComponent  {
  @Input()
  Attraction attraction;


}
