import 'package:arquella_hub/data/system/config/test_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../calls/data.dart';

const String tableName = "calls";
const String columnId = "_id";
const String columnRoomCode = "roomCode";
const String columnUuid = "uuid";
const String columnAlertType = "alertType";
const String columnStartTime = "startTime";
const String columnEndTime = "endTime";
const String columnDuration = "duration";
const String columnClearType = "clearType";
const String columnYear = "year";
const String columnMonth = "month";
const String columnDay = "day";
const String columnZone = "zone";
const String columnRoomName = "name";
const String columnCarer = "carer";
const String columnServerRef = "serverRef";
const String columnClearUuid = "clearUuid";

Database? callDB;

Future openDb()async{
  callDB = await CallDataBaseHelper().openDB();
}

class CallDataBaseHelper{

  Future<Database> openDB()async{
    final directory = await getApplicationDocumentsDirectory();
    Database callDb = await openDatabase(
        join(directory.path, 'callDB.db'),
        version: 1,
        onCreate: (Database db, int version)async{
          await db.execute('CREATE TABLE $tableName ($columnId integer primary key autoincrement, $columnRoomCode text not null, $columnUuid text not null, $columnAlertType text not null, $columnStartTime text not null, $columnEndTime text not null, $columnDuration text not null, $columnClearType text not null, $columnYear text not null, $columnMonth text not null, $columnDay text not null, $columnZone text not null, $columnRoomName text not null, $columnCarer text not null, $columnServerRef text not null, $columnClearUuid text not null)');
        });
    return callDb;
  }

  Future<List<CallData>> getAllCalls()async{
    if(callDB == null){
      await openDb();
    }
    List<CallData> l = [];
    List<Map<String, Object?>> maps = await callDB!.rawQuery("SELECT * FROM $tableName");
    for(Map<String, Object?> el in maps){
      String serverRef = el[columnServerRef] as String;
      if(serverRef.startsWith(".")){
        serverRef = "0";
      }
      CallData cd = CallData(el[columnId] as int, el[columnRoomCode] as String, el[columnAlertType] as String, DateTime.parse(el[columnStartTime] as String), DateTime.parse(el[columnEndTime] as String), int.parse(el[columnDuration] as String), el[columnClearType] as String, el[columnCarer] as String, el[columnUuid] as String, int.parse(el[columnDay] as String), int.parse(el[columnMonth] as String), int.parse(el[columnYear] as String), serverRef, el[columnZone] as String, el[columnRoomName] as String, el[columnClearUuid] as String);
      l.add(cd);
    }

    return l;
  }

  Future<List<CallData>> getCallByDate(String day, String month, String year)async{
    if(callDB == null){
      await openDb();
    }
    List<CallData> l = [];
    List<Map<String, Object?>> maps = await callDB!.rawQuery("SELECT * FROM $tableName WHERE $columnYear = ? AND $columnMonth = ? AND $columnDay = ?", [year, month, day]);
    for(Map<String, Object?> el in maps){
      String serverRef = el[columnServerRef] as String;
      if(serverRef.startsWith(".")){
        serverRef = "0";
      }
      CallData cd = CallData(el[columnId] as int, el[columnRoomCode] as String, el[columnAlertType] as String, DateTime.parse(el[columnStartTime] as String), DateTime.parse(el[columnEndTime] as String), int.parse(el[columnDuration] as String), el[columnClearType] as String, el[columnCarer] as String, el[columnUuid] as String, int.parse(el[columnDay] as String), int.parse(el[columnMonth] as String), int.parse(el[columnYear] as String), serverRef, el[columnZone] as String, el[columnRoomName] as String, el[columnClearUuid] as String);
      l.add(cd);
    }

    return l;
  }

  Future<List<CallData>> getUnsavedCalls()async{
    if(callDB == null){
      await openDb();
    }
    List<CallData> l = [];
    List<Map<String, Object?>> maps = await callDB!.rawQuery("SELECT * FROM $tableName WHERE $columnServerRef = ?", ["-1"]);
    for(Map<String, Object?> el in maps){
      String serverRef = "";
      if(el.containsKey(columnServerRef)){
        serverRef = el[columnServerRef] as String;
        if(serverRef.startsWith(".")){
          serverRef = "0";
        }
      }
      CallData cd = CallData(el[columnId] as int, el[columnRoomCode] as String, el[columnAlertType] as String, DateTime.parse(el[columnStartTime] as String), DateTime.parse(el[columnEndTime] as String), int.parse(el[columnDuration] as String), el[columnClearType] as String, el[columnCarer] as String, el[columnUuid] as String, int.parse(el[columnDay] as String), int.parse(el[columnMonth] as String), int.parse(el[columnYear] as String), serverRef, el[columnZone] as String, el[columnRoomName] as String, el[columnClearUuid] as String);
      l.add(cd);
    }
    return l;
  }

  Future<int> saveCall(CallData cd)async{
    if(callDB == null){
      await openDb();
    }
    int toReturn = await callDB!.insert(tableName, cd.toMap());
    return toReturn;
  }

  Future<bool> updateCall(CallData cd)async{
    if(callDB == null){
      await openDb();
    }
    bool updated2 = false;
    var l = await callDB!.rawUpdate("UPDATE $tableName SET $columnEndTime = ?, $columnDuration = ?, $columnClearType = ?, $columnCarer = ?, $columnClearUuid = ? WHERE $columnId = ?", [cd.end.toIso8601String(), cd.durationSeconds.toString(), cd.clearType, cd.carer, cd.clearUuid, cd.id]);
    if(!l.isNaN){
      updated2 = true;
    }

    return updated2;
  }

  Future callSavedToServer(int id, String fileRef)async{
    if(callDB == null){
      await openDb();
    }
    await callDB!.rawUpdate("UPDATE $tableName SET $columnServerRef = ? WHERE $columnId = ?", [fileRef, id]);
  }
}

// class CallData{
//   int? id;
//   String roomCode;
//   String callCode;
//   DateTime start;
//   DateTime end;
//   int durationSeconds;
//   String clearType;
//   String carer;
//   String uuid;
//   int day;
//   int month;
//   int year;
//   int serverRef;
//   String zone;
//   String roomName;
//   String clearUuid;
//
//
//   CallData(this.id, this.roomCode, this.callCode, this.start, this.end, this.durationSeconds, this.clearType, this.carer, this.uuid, this.day, this.month, this.year, this.serverRef, this.zone, this.roomName, this.clearUuid);
//
//   Map<String, Object?> toMap(){
//     var map = <String, Object?>{
//       columnUuid: uuid,
//       columnRoomCode: roomCode,
//       columnAlertType: callCode,
//       columnStartTime: start.toIso8601String(),
//       columnEndTime: end.toIso8601String(),
//       columnDuration: durationSeconds.toString(),
//       columnClearType: clearType,
//       columnYear: year,
//       columnMonth: month,
//       columnDay: day,
//       columnZone: zoneConfigTesting[configMapTesting[roomCode]!.zoneId],
//       columnRoomName: configMapTesting[roomCode]!.name,
//       columnCarer: carer,
//       columnServerRef: serverRef.toString(),
//       columnClearUuid: clearUuid
//     };
//     if(id != null){
//       map[columnId] = id;
//     }
//     return map;
//   }
//
//   Map<String, String> toJson(){
//     return {
//       "id": id.toString(),
//       "uuid": uuid,
//       "roomCode": roomCode,
//       "type": callCode,
//       "startTime": start.toIso8601String(),
//       "endTime": end.toIso8601String(),
//       "duration": durationSeconds.toString(),
//       "clear": clearType,
//       "room": roomName,
//       "zone": zone,
//       "carer": carer,
//       "day": day.toString(),
//       "month": month.toString(),
//       "year": year.toString(),
//       "clearUuid": clearUuid
//     };
//   }
// }