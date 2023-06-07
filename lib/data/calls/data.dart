import 'dart:convert';

import 'package:arquella_hub/data/database/call_records.dart';

import '../system/config/test_config.dart';

class Alert{
  String alertType;
  String zone;
  String room;
  String? dbRef;
  DateTime alertTime;
  String txCode;
  String? carer;
  String callPointId;
  String alertUuid;
  bool batteryLow;

  Alert(this.alertType, this.zone, this.room, this.dbRef, this.alertTime, this.txCode, this.callPointId, this.alertUuid, this.batteryLow);


  Map<String, String> toJson(){
    String db = "", battLow = 'false';
    if(dbRef != null){
      db = dbRef!;
    }
    if(batteryLow){
      battLow = 'true';
    }
    return {
      "alertType": alertType,
      "zone": zone,
      "room": room,
      "dbRef": db,
      "alertTime": alertTime.toIso8601String(),
      "txCode": txCode,
      "callPointId": callPointId,
      "batteryLow": battLow
    };
  }
}

class CallData{
  int? id;
  String roomCode;
  String callCode;
  DateTime start;
  DateTime end;
  int durationSeconds;
  String clearType;
  String carer;
  String uuid;
  int day;
  int month;
  int year;
  String? serverRef;
  String zone;
  String roomName;
  String clearUuid;

  CallData(this.id, this.roomCode, this.callCode, this.start, this.end, this.durationSeconds, this.clearType, this.carer, this.uuid, this.day, this.month, this.year, this.serverRef, this.zone, this.roomName, this.clearUuid);

  Map<String, Object?> toMap(){
    var map = <String, Object?>{
      columnUuid: uuid,
      columnRoomCode: roomCode,
      columnAlertType: callCode,
      columnStartTime: start.toIso8601String(),
      columnEndTime: end.toIso8601String(),
      columnDuration: durationSeconds.toString(),
      columnClearType: clearType,
      columnYear: year,
      columnMonth: month,
      columnDay: day,
      columnZone: zoneConfigTesting[configMapTesting[roomCode]!.zoneId],
      columnRoomName: configMapTesting[roomCode]!.name,
      columnCarer: carer,
      columnServerRef: serverRef.toString(),
      columnClearUuid: clearUuid
    };
    if(id != null){
      map[columnId] = id;
    }
    return map;
  }

  Map<String, String> toJson(){
    return {
      "id": id.toString(),
      "uuid": uuid,
      "roomCode": roomCode,
      "type": callCode,
      "startTime": start.toIso8601String(),
      "endTime": end.toIso8601String(),
      "duration": durationSeconds.toString(),
      "clear": clearType,
      "room": roomName,
      "zone": zone,
      "carer": carer,
      "day": day.toString(),
      "month": month.toString(),
      "year": year.toString(),
      "clearUuid": clearUuid
    };
  }
}

class Resident{
  late int? id;
  late String name;
  late String roomName;
  late String ref;
  late String zoneName;
  late List<String> assocUnits; //List all units that are associated with the resident ;
  late Map<String, String> thirdPartyRef;
  late Map<String, dynamic> info;

  Resident(this.id, this.name, this.roomName, this.ref, this.zoneName, this.assocUnits, this.thirdPartyRef, this.info);

  Map<String, String> toMap(){
    Map<String, String> map = {
      "name": name,
      "roomName": roomName,
      "ref": ref,
      "zoneName": zoneName,
      "assocUnits": assocUnits.toString(),
      "thirdParty": jsonEncode(thirdPartyRef),
      "info": jsonEncode(info)
    };
    if(id != null){
      map[columnId] = id!.toString();
    }
    return map;
  }

  Resident.fromMap(Map<String, String>map){
    name = map["name"]!;
    roomName = map["roomName"]!;
    ref = map["ref"]!;
    zoneName = map["zoneName"]!;
    thirdPartyRef = jsonDecode(map["thirdParty"]!);
    info = jsonDecode(map["info"]!);
  }
}