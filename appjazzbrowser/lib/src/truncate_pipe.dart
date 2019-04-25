//truncate_pipe
import 'dart:math' as math;
import 'package:angular/angular.dart';

/*
 * Raise the value exponentially
 * Takes an exponent argument that defaults to 1.
 * Usage:
 *   value | truncate:limit
 * Example:
 *   {{ 2 |  truncate:2}}
 *   formats to: bi...
 */
@Pipe('truncate')
class TruncatePipe extends PipeTransform {
  String transform(String value, int truncateAt) {
    if (value == null) {
      return value;
    }
    //int truncateAt = value.length-1;
    String elepsis = "..."; //define your variable truncation elipsis here
    String truncated = "";

    if (value.length > truncateAt) {
      truncated = value.substring(0, truncateAt - elepsis.length) + elepsis;
    } else {
      truncated = value;
    }
    return truncated;
  }
}
