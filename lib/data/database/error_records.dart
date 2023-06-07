

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

const String tableName = "errors";
const String columnId = "_id";
const String columnUuid = "uuid";
const String columnYear = "year";
const String columnMonth = "month";
const String columnDay = "day";
const String columnServerRef = "serverRef";
const String columnError = "error";

Database? errorDb;

var uuid = const Uuid();

// Future openDb()async{
//   errorDb = await ErrorDataBaseHelper().openDB();
// }

class ErrorDataBaseHelper{
  Future<Database> openDB()async{
    final directory = await getApplicationDocumentsDirectory();
    Database errorDb = await openDatabase(
        join(directory.path, 'errorDB.db'),
        version: 1,
        onCreate: (Database db, int version)async{
          await db.execute('CREATE TABLE $tableName ($columnId integer primary key autoincrement, $columnUuid text not null, $columnYear text not null, $columnMonth text not null, $columnDay text not null, $columnServerRef text not null, $columnError text not null)');
        });
    return errorDb;
  }

  Future<int> saveError(ErrorData ed)async{
    Database eDB = await openDB();
    int toReturn = await eDB.insert(tableName, ed.toMap());
    eDB.close();
    return toReturn;
  }

  Future<List<ErrorData>> getAll()async{
    Database eDB = await openDB();
    List<ErrorData> toReturn = [];
    List<Map<String, Object?>> maps = await eDB.rawQuery("SELECT * FROM $tableName");
    eDB.close();
    for(Map<String, Object?> el in maps){
      ErrorData ed = ErrorData.fromMap(el);
      toReturn.add(ed);
    }

    return toReturn;
  }

  Future<List<ErrorData>> getErrorByDate(String day, String month, String year)async{
    Database eDB = await openDB();
    List<ErrorData> l = [];
    List<Map<String, Object?>> maps = await eDB.rawQuery("SELECT * FROM $tableName WHERE $columnYear = ? AND $columnMonth = ? AND $columnDay = ?", [year, month, day]);
    for(Map<String, Object?> el in maps){
      ErrorData ed = ErrorData.fromMap(el);
      l.add(ed);
    }

    return l;
  }

  Future<List<ErrorData>> getUnsavedErrors()async{
    Database eDB = await openDB();
    List<ErrorData> l = [];
    List<Map<String, Object?>> maps = await eDB.rawQuery("SELECT * FROM $tableName WHERE $columnServerRef = ?", ["-1"]);
    eDB.close();
    for(Map<String, Object?> el in maps){
      ErrorData cd = ErrorData.fromMap(el);
      l.add(cd);
    }
    return l;
  }

  Future errorSavedToServer(int id, String fileRef)async{
    Database eDB = await openDB();
    await eDB.rawUpdate("UPDATE $tableName SET $columnServerRef = ? WHERE $columnId = ?", [fileRef, id]);
    eDB.close();
  }
}

class ErrorData{
  late int? id;
  late String uuid;
  late String year;
  late String month;
  late String day;
  late String serverRef;
  late String error;

  ErrorData(this.id, this.uuid, this.year, this.month, this.day, this.serverRef, this.error);

  Map<String, Object?> toMap(){
    var map = <String, Object?>{
      columnUuid: uuid,
      columnYear: year,
      columnMonth: month,
      columnDay: day,
      columnServerRef: serverRef,
      columnError: error
    };
    if(id != null){
      map[columnId] = id;
    }
    return map;
  }

  ErrorData.fromMap(Map<String, Object?> map){
    id = map[columnId] as int?;
    uuid = map[columnUuid] as String;
    year = map[columnYear] as String;
    month = map[columnMonth] as String;
    day = map[columnDay] as String;
    serverRef = map[columnServerRef] as String;
    error = map[columnError] as String;
  }

  Map<String, String> toJson(){
    return{
      "id": id.toString(),
      "uuid": uuid,
      "year": year,
      "month": month,
      "day": day,
      "serverRef": serverRef,
      "error": error
    };
  }
}

Future saveError(String errorData)async{
  //Set datetime to UTC to ignore daylight savings and timezones
  DateTime dt = DateTime.now().toUtc();
  ErrorData ed = ErrorData(null, uuid.v4(), dt.year.toString(), dt.month.toString(), dt.day.toString(), "-1", errorData);
  await ErrorDataBaseHelper().saveError(ed);
}