import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'package:arquella_hub/model/entity/calldata_entity.dart';

part 'appdb.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'CallDb.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [CallTable])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //Get the list of calls
  Future<List<CallTableData>> getCalls() async {
    return await select(callTable).get();
  }

  Future<CallTableData> getCall(int callId) async {
    return await (select(callTable)..where((tbl) => tbl.callId.equals(callId)))
        .getSingle();
  }

  Future<bool> updateCall(CallTableCompanion entity) async {
    return await update(callTable).replace(entity);
  }

  Future<int> insertCall(CallTableCompanion entity) async {
    return await into(callTable).insert(entity);
  }

  Future<int> deleteCall(int callId) async {
    return await (delete(callTable)..where((tbl) => tbl.callId.equals(callId)))
        .go();
  }
}
