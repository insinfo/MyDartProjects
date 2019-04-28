import 'dart:async';
import 'dart:html';
import 'package:intl/intl.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../../serialization_interface.dart';
import '../../response_list.dart';

//utils
import 'utils.dart';

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
  TableElement tableElement;

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

  final _deleteRequest = StreamController<int>();

  @Output()
  Stream<int> get deleteRequest => _deleteRequest.stream;

  void delete() {
    _deleteRequest.add(10);
  }

  final NodeValidatorBuilder _htmlValidator = new NodeValidatorBuilder.common()
    ..allowHtml5()
    ..allowImages()
    ..allowInlineStyles()
    ..allowTextElements()
    ..allowSvg()
    ..allowElement('a', attributes: ['href'])
    ..allowElement('img', attributes: ['src']);

  @override
  void ngOnInit() {
    //constructor(private e: ElementRef) {
    //toastDiv.classes.add('mdt--load');
    //this.e.nativeElement.setAttribute("spellcheck", "true");
    // draw();

    //tableElement.addEventListener("click", onRowClick());

    /*tableElement.querySelector("tbody").addEventListener("click",(event) {
      HtmlElement clickedElement = event.currentTarget;
      var itemId = clickedElement.tagName;
      print(itemId);
    });*/
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

        Element tableHead = tableElement.createTHead();
        TableRowElement tableHeaderRow = tableElement.tHead.insertRow(-1);

        for (final col in columns) {
          var key = col.containsKey('key') ? col['key'] : null;
          var title = col.containsKey('title') ? col['title'] : null;
          var type = col.containsKey('type') ? col['type'] : null;
          var limit = col.containsKey('limit') ? col['limit'] : null;

          var th = new Element.tag('th');
          th.text = title;
          tableHeaderRow.insertAdjacentElement('beforeend', th);
        }

        TableSectionElement tBody = tableElement.createTBody();
        for (final item in _data) {
          var row = item.toJson();
          TableRowElement tableRow = tBody.insertRow(-1);
          tableRow.addEventListener("click", (event) {
            HtmlElement clickedElement = event.currentTarget;
            onRowClick();
          });

          for (final col in columns) {
            var key = col.containsKey('key') ? col['key'] : null;
            var title = col.containsKey('title') ? col['title'] : null;
            var type = col.containsKey('type') ? col['type'] : null;
            var limit = col.containsKey('limit') ? col['limit'] : null;
            var format = col.containsKey('format') ? col['format'] : null;
            var tdContent = "";

            switch (type.toString()) {
              case 'date':
                if (row[key] != null) {
                  var fmt = format == null ? 'dd/MM/yyyy' : format;
                  var formatter = new DateFormat(fmt);
                  var date = DateTime.tryParse(row[key].toString());
                  if (date != null) {
                    tdContent = formatter.format(date);
                  }
                }
                break;
              case 'string':
                var str = row[key.toString()].toString();
                if (limit != null) {
                  str = Utils.truncate(str, limit);
                }
                tdContent = str;
                break;
              case 'img':
                var src = row[key.toString()].toString();
                var img = ImageElement();
                img.src = src;
                img.height = 40;
                tdContent = img.outerHtml;
                break;
              default:
                tdContent = row[key.toString()].toString();
            }
            var td = new Element.tag('td');
            td.setInnerHtml(tdContent,
                treeSanitizer: NodeTreeSanitizer.trusted);
            ;
            tableRow.insertAdjacentElement('beforeend', td);
          }
        }
      }
    }
  }

  onRowClick() {
    print("onRowClick");
  }
}
