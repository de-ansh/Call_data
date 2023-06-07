

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../system/config/data.dart';

const String tableName = "zones";
const String columnId = "_id";
const String columnZoneName = "zoneName";
const String columnZoneActive = "zoneActive";
const String columnUnits = "zoneUnits";

class ZoneDataBaseHelper{
  Future<Database> openDB()async{
    final directory = await getApplicationDocumentsDirectory();
    Database callDb = await openDatabase(
        join(directory.path, 'zoneDB.db'),
        version: 1,
        onCreate: (Database db, int version)async{
          await db.execute('CREATE TABLE $tableName ($columnId integer primary key autoincrement, $columnZoneName text not null, $columnZoneActive text not null, $columnUnits text not null)');
        });
    return callDb;
  }

  Future<int> saveZone(Zone zone)async{
    Database db = await openDB();
    int toReturn = await db.insert(tableName, zone.toMap());
    await db.close();
    return toReturn;
  }

  Future<List<Zone>> getAllZones()async{
    Database db = await openDB();
    List<Zone> toReturn = [];
    var rows = await db.rawQuery("SELECT * FROM $tableName");
    for(Map<String, Object?> el in rows){
      Zone zone = Zone.fromMap(el);
      toReturn.add(zone);
    }
    await db.close();
    return toReturn;
  }

  Future<Zone> getZoneById(int id)async{
    Zone toReturn;
    Database db = await openDB();
    var rows = await db.rawQuery("SELECT * FROM $tableName WHERE $columnId = ?", [id]);
    toReturn = Zone.fromMap(rows.first);
    await db.close();
    return toReturn;
  }
}