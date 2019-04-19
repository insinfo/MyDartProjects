import 'dart:async';

import 'package:angular/core.dart';
import 'package:appjazzweb/src/model/attraction.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class AttractionService {
  //final attractions = <Attraction>[
  final List<Attraction> attractions = [
    Attraction(0, "Ivan Lins", "descrição", 2018, DateTime.now(), "picture",
        "video", "media"),
    Attraction(0, "Ivan Lins", "descrição", 2018, DateTime.now(), "picture",
        "video", "media")
  ];

  //List<Attraction> getAll() => attractions;
  Future<List<Attraction>> getAll() async => attractions;
}
