class DataTableFilter {
  int limit;
  int offset;
  String searchString;

  DataTableFilter({this.limit = 10, this.offset = 0, this.searchString});

  String toUrlParams() {
    var search = searchString != null && searchString.isNotEmpty
        ? "&search=${searchString}"
        : "";

    var limi = this.limit != -1 ? "&limit=${this.limit}" : "";
    var offse = this.limit != -1 ? "&offset=${this.offset}" : "";
    return "?" + limi + offse + search;
  }
}
