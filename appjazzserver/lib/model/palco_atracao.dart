import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';
import 'atracao.dart';
import 'palco.dart';


// Esse class é uma tabela de junção ente palco e atração
class PalcoAtracao extends ManagedObject<_PalcoAtracao> implements _PalcoAtracao {
}

//palcoAtracao
@Table(name: "palcoAtracao")
class _PalcoAtracao {
  @primaryKey
  int id;

  @Relate(#palcoAtracao)
  Palco palco;

  @Relate(#palcoAtracao)
  Atracao atracao;


}