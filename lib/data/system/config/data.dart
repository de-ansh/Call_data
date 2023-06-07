class PanelData{
  String panelId;
  String panelVersion;
  String ipaddress;
  String macAddress;

  PanelData(this.panelId, this.panelVersion, this.ipaddress, this.macAddress);
}

class SiteConfig{
  String careGroupName;
  String careGroupId;
  String locationId;
  String locationName;
  late Map<String, Unit> siteUnits;

  SiteConfig(this.careGroupName, this.careGroupId, this.locationId, this.locationName, this.siteUnits);
}

class Unit{
  String txid; //Unit id
  String name; //What text should be displayed for this unit
  String zoneId; //What zone this unit is linked to
  String residentId; //What resident this unit is linked to
  bool active; //To turn on and off the displaying of the unit in the call stack
  List<String> linkedUnits; // What other units are linked to this unit

  Unit(this.txid, this.name, this.zoneId, this.residentId, this.active, this.linkedUnits);

  Map<String, String> toJson(){
    return{
      "txId": txid,
      "name": name,
      "zoneId": zoneId,
      "residentId": residentId
    };
  }
}

class Zone{
  late String name;
  late int? id;
  late bool active;
  late List unitList;

  Zone(this.name, this.id, this.active, this.unitList);

  Map<String, String> toJson(){
    String activeString = "false";
    if(active){
      activeString = "true";
    }
    return{
      "name": name,
      "id": id.toString(),
      "active": activeString,
      "unitList": unitList.toString()
    };
  }

  Zone.fromMap(Map<String, dynamic>map){
    name = map["name"];
    id = int.parse(map["id"]);
    if(map["active"] == "true"){
      active = true;
    }else{
      active = false;
    }
    unitList = map["unitList"].split(",");
  }

  Map<String, Object?> toMap(){
    String activeString = "false";
    if(active){
      activeString = "true";
    }
    var map = <String, Object?>{
      "zoneName": name,
      "zoneActive": activeString,
      "zoneUnits": unitList.toString()
    };
    if(id != null){
      map["_id"] = id;
    }
    return map;
  }
}

class Room{
  late List<String> associatedUnits;
  String name;
  String zoneId;
  String residentId;
  String roomId;

  Room(this.associatedUnits, this.name, this.zoneId, this.residentId, this.roomId);
}

class Resident{
  String name;
  String residentId;
  String roomId;
  late List<String> associatedUnits;

  Resident(this.name, this.residentId, this.roomId, this.associatedUnits);
}

class Carer{
  String name;
  String uuid;
  String role;
  int access;
  int pin;

  Carer(this.name, this.uuid, this.role, this.access, this.pin);
}

bool screenLocked = true;

