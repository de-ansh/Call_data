

import 'data.dart';
//Unit structure unit_ID, Room Name, Zone_ID, Resident_ID, Unit_Active, Linked_Units

Map<String, Unit> configMapTesting = {
  "001": Unit("001", "Lloyd", "0", "0", true, []),
  "002": Unit("002", "Davy", "1", "1", true, []),
  "003": Unit("003", "Lloyd No3", "0", "0", true, [])
};

Map<String, String> zoneConfigTesting = {
  "0": "Lloyd's Desk",
  "1": "Davy's Desk"
};
//Room = associated units, name, zone id, resident id, room id
Map<String, Room> roomConfigTesting = {
  "0": Room(["001", "003"], "Test Room 1", "0", "0", "0"),
  "1": Room(["002"], "Test Room 2", "1", "1", "1"),
};
//Resident = name, resident id, room id, associated units
Map<String, Resident> residentConfigTesting = {
  "0": Resident("Lloyd", "0", "0", ["001", "003"]),
  "1": Resident("Davy", "0", "0", ["001", "003"]),
};