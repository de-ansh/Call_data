import 'package:arquella_hub/data/calls/engine/call_engine.dart';
import 'package:arquella_hub/data/system/config/data.dart';
import 'package:arquella_hub/data/system/config/test_config.dart';
import 'package:flutter/material.dart';

void usbProcessor(List<int> data)async{
  debugPrint(data.toString());
  //processing data from usb, need to extract the room code and the call code first convert charcodes to string
  String usbData = String.fromCharCodes(data);
  //extract the room code from the transmission
  String roomCode = "${usbData[2]}${usbData[4]}${usbData[6]}";
  //extract the room code and the call code
  String txId = "$roomCode.${usbData[10]}";
  debugPrint(usbData);
  debugPrint(txId);
  //Set datetime to UTC to ignore daylight savings and timezones
  DateTime dt = DateTime.now().toUtc();
  //check if it is a heartbeat or call
  String callCode = String.fromCharCode(data[10]);
  //Checking for low battery status
  String batteryIndicator = String.fromCharCode(data[9]);
  //For testing, in production switch to production config
  if(configMapTesting.containsKey(roomCode)){
    Unit callingUnit = configMapTesting[roomCode]!;
    // debugPrint(callingUnit.toJson().toString());
    callEngineStep1(callingUnit, usbData[10], usbData, batteryIndicator);

  }else{
    //Need to add database for un-configured units
    debugPrint("Not In Config");
  }

}