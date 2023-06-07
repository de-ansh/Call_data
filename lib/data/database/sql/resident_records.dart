

import 'package:arquella_hub/data/calls/data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String tableName = "residents";
const String columnId = "_id";
const String columnResidentName = "name";
const String columnRoomName = "roomName";
const String columnUuid = "uuid";
const String columnZone = "zone";
const String columnAssocUnits = "assocUnits";
const String columnThirdParty = "thirdParty";
const String columnInfo = "info";

class ResidentDataBaseHelper{
  Future<Database> openDB()async{
    final directory = await getApplicationDocumentsDirectory();
    Database resDb = await openDatabase(
        join(directory.path, 'residentDB.db'),
        version: 1,
        onCreate: (Database db, int version)async{
          await db.execute('CREATE TABLE $tableName ($columnId integer primary key autoincrement, $columnResidentName text not null, $columnRoomName text not null, $columnUuid text not null, $columnZone text not null, $columnAssocUnits text not null, $columnThirdParty text not null, $columnInfo text not null');
        });
    return resDb;
  }

  Future<int> saveResident(Resident rd)async{
    Database rDB = await openDB();
    int toReturn = await rDB.insert(tableName, rd.toMap());
    await rDB.close();
    return toReturn;
  }

  Future<Resident?> getResidentById(int id)async{
    Database rDB = await openDB();
    Resident? toReturn;

    await rDB.close();
    return toReturn;
  }
}