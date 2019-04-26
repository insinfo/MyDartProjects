import 'dart:async';
import 'dart:html';
import 'package:intl/intl.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../../serialization_interface.dart';
import '../../response_list.dart';

@Component(
  selector: 'data-table',
  templateUrl: 'data_table_component.html',
  styleUrls: [
    'data_table_component.css',
  ],
  directives: [
    formDirectives,
    coreDirectives,
    routerDirectives,
  ],
)
//A Material Design table component for AngularDart OnChanges
class DataTableComponent implements OnInit, AfterChanges {
  @ViewChild("tableElement") //HtmlElement
  HtmlElement tableElement;

  @Input()
  bool showFilter = true;

  @Input()
  bool showItemsLimit = true;
  RList<ISerialization> _data;

  @Input()
  set data(RList<ISerialization> data) {
    _data = data;
  }

  RList<ISerialization> get data {
    return _data;
  }

  @override
  void ngOnInit() {
    //constructor(private e: ElementRef) {
    //toastDiv.classes.add('mdt--load');
    //this.e.nativeElement.setAttribute("spellcheck", "true");
    // draw();
    print(tableElement);
  }

  /*@override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    draw();
  }*/

  @override
  void ngAfterChanges() {
    draw();
  }

  void draw() {
    if (_data != null) {
      if (_data.isNotEmpty) {
        List<Map<String, dynamic>> columns = _data[0].toDisplayNames();

        var tableTh = "";
        for (final col in columns) {
          var key = col.containsKey('key') ? col['key'] : null;
          var title = col.containsKey('title') ? col['title'] : null;
          var type = col.containsKey('type') ? col['type'] : null;
          var limit = col.containsKey('limit') ? col['limit'] : null;
          tableTh += "<th>${title}</th>";
        }

        tableElement.querySelector('thead tr').innerHtml = tableTh;

        var trs = "";

        for (final item in _data) {
          var row = item.toJson();

          /*tds.forEach((key, value) {
          });*/
          var tds = "";
          for (final col in columns) {
            var key = col.containsKey('key') ? col['key'] : null;
            var title = col.containsKey('title') ? col['title'] : null;
            var type = col.containsKey('type') ? col['type'] : null;
            var limit = col.containsKey('limit') ? col['limit'] : null;
            var tdContent = "";

            switch (type.toString()) {
              case 'date':
                if (row[key]) {
                  var formatter = new DateFormat('dd/MM/yyyy');
                  var date = DateTime.tryParse(row[key]);
                  if (date != null) {
                    tdContent = formatter.format(date);
                  }
                }
                break;
              default:
                tdContent = row[key.toString()].toString();
            }

            tds += "<td>${tdContent}</td>";
          }

          trs += "<tr>${tds}</tr>";
        }

        tableElement.querySelector('tbody').innerHtml = trs;
      }
    }
  }

/*void showToast(String message){
    toastDiv.style.backgroundColor = color;
    toastDiv.classes.remove('mdt--load');
  }*/
}
