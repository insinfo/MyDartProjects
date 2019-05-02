import 'dart:async';
import 'dart:core';
import 'package:aqueduct/aqueduct.dart';
import 'atracao.dart';
import 'palco.dart';

// Esse class é uma tabela de junção ente palco e atração
class PalcoAtracao extends ManagedObject<_PalcoAtracao>
    implements _PalcoAtracao {}

//palcoAtracao
@Table(name: "palcoAtracao")
class _PalcoAtracao {
  @Column(
      primaryKey: true,
      unique: true,
      autoincrement: true,
      databaseType: ManagedPropertyType.bigInteger)
  int id;

  @Relate(#palcoAtracao, isRequired: false, onDelete: DeleteRule.nullify)
  Palco palco;

  @Relate(#palcoAtracao, isRequired: false, onDelete: DeleteRule.nullify)
  Atracao atracao;

  @Column(unique: false, nullable: true)
  DateTime data;

  @Column(unique: false, nullable: true)
  String hora;

}
