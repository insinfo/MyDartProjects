class DataTableFilter {
  int limit;
  int offset;
  String searchString;
  Map<String, String> stringParams = {};

  DataTableFilter({this.limit = 10, this.offset = 0, this.searchString});

  String toUrlParams() {
    var search = searchString != null ? "&search=${searchString}" : "";
    var limi = this.limit != -1 ? "&limit=${this.limit}" : "";
    var offse = this.limit != -1 ? "&offset=${this.offset}" : "";
    return "?" + limi + offse + search;
  }

  Map<String, String> getParams() {
    if (this.limit != null && this.limit != -1) {
      stringParams["limit"] = this.limit.toString();
    }
    if (this.offset != null && this.offset != -1) {
      stringParams["offset"] = this.offset.toString();
    }
    if (this.searchString != null) {
      stringParams["search"] = this.searchString;
    }
    return stringParams;
  }

  Map<String, String> addParam(String paramName, String paramValue) {
    if (paramName != null && paramName.isNotEmpty) {
      stringParams[paramName] = paramValue;
    }
    return stringParams;
  }
}
