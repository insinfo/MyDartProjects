import 'dart:collection';

class RList<E> extends ListBase<E> {
  List innerList = new List();

  int get length => innerList.length;

  set length(int length) {
    innerList.length = length;
  }

  operator []=(int index, E value) {
    innerList[index] = value;
  }

  E operator [](int index) => innerList[index];

  // Though not strictly necessary, for performance reasons
  // you should implement add and addAll.

  void add(E value) => innerList.add(value);

  void addAll(Iterable<E> all) => innerList.addAll(all);

  int _totalRecords = 0;

  int get totalRecords => _totalRecords;

  set totalRecords(int totalRecords) {
    _totalRecords = totalRecords;
  }
}
