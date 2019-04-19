import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../services/attraction_service.dart';
import '../model/attraction.dart';
import 'attractions_form_component.dart';

@Component(
  selector: 'attraction-list',//isto vai ser o nome da tag do componente
  styleUrls: ['../../app_component.css'],
  templateUrl: '../templates/attractions_list_component.html',
  directives: [formDirectives,coreDirectives,AttractionsFormComponent],
  providers: [ClassProvider(AttractionService)],
)

class AttractionsListComponent implements OnInit {
  List<Attraction> attractions;
 Attraction selected;

  final AttractionService _attractionService;
  AttractionsListComponent(this._attractionService);

  Future<void> _getAttractions() async {
    attractions = await _attractionService.getAll();
  }

  /*void _getAttractions() {
    _attractionService.getAll().then((attractions) => this._attractions = attractions);
  }*/

  void onSelect(Attraction selected) => selected = selected;

  void ngOnInit() => _getAttractions();

}
