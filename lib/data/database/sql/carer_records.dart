import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CarerDatabaseHelper{
  Future<Database> openDB()async{
    final directory = await getApplicationDocumentsDirectory();
    Database resDb = await openDatabase(
        join(directory.path, 'carersDB.db'),
        version: 1,
        onCreate: (Database db, int version)async{
          await db.execute('CREATE TABLE carersTable (id integer primary key autoincrement, name text not null, position text not null, email text not null, access text not null, uuid text not null, pin text not null');
        });
    return resDb;
  }

  Future<int> saveCarer(Carer cd)async{
    Database rDB = await openDB();
    int toReturn = await rDB.insert("carersTable", cd.toMap());
    await rDB.close();
    return toReturn;
  }

  Future<Carer> getCarerById(int id)async{
    Database rDB = await openDB();
    Carer toReturn;
    var data = await rDB.query("carersTable", where: "id", whereArgs: [id], limit: 1);
    toReturn = Carer.fromMap(data.first);
    await rDB.close();
    return toReturn;
  }

  Future<List<Carer>> getAllCarers()async{
    Database rDB = await openDB();
    var data = await rDB.query("carersTable");
    List<Carer> toReturn = [];
    for(var c in data){
      Carer carer = Carer.fromMap(c);
      toReturn.add(carer);
    }
    await rDB.close();
    return toReturn;
  }
}

class Carer{
  late int? id;
  late String name;
  late String position;
  late String email;
  late String access;
  late String uuid;
  late int pin;

  Carer(this.id, this.name, this.position, this.email, this.access, this.uuid, this.pin);

  Map<String, String> toJson(){
    return {
      "id": id.toString(),
      "name": name,
      "position": position,
      "email": email,
      "access": access,
      "uuid": uuid,
      "pin": pin.toString()
    };
  }

  Carer.fromMap(Map<String, dynamic>map){
    id = map["id"];
    name = map["name"];
    position = map["position"];
    email = map["email"];
    access = map["access"];
    uuid = map["uuid"];
    pin = map["pin"];
  }

  Map<String, Object?> toMap(){
    var map = <String, Object?>{
      "name": name,
      "position": position,
      "email": email,
      "access": access,
      "uuid": uuid,
      "pin": pin.toString()
    };
    if(id != null){
      map["id"] = id;
    }
    return map;
  }
}