import 'dart:async';
import 'dart:collection';

import 'package:arquella_hub/data/database/error_records.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../server/local/websocket.dart';
import '../../system/config/data.dart';
import '../../system/config/test_config.dart';
import '../data.dart';
import '../../database/sql/call_records.dart';

StreamController callEngineStream = StreamController.broadcast();
Map<String, Alert> liveCallStack = {};
List<Alert> callDisplayMap = [];

bool checkList = false;


//Step 1 checks if the live-call stack already contains the call
void callEngineStep1(Unit callData, String alertType, String txCode, String batteryIndicator){
  //Check if battery level is low - 'B' for ok and 'b' for low
  bool batteryLvl = false;
  if(batteryIndicator == 'b'){
    batteryLvl = true;
  }
  DateTime dt = DateTime.now().toUtc();
  Alert newAlert = Alert(alertType, callData.zoneId, callData.name, null, dt, txCode, callData.txid, const Uuid().v4(), batteryLvl);
  debugPrint(newAlert.toString());
  if(liveCallStack.containsKey(callData.txid)){
    callFilter(callData, newAlert);
  }else{
    liveCallStack[callData.txid] = newAlert;
    callEngineStep2();
  }
}

void callEngineStep2(){
  //Clear the list of calls before processing otherwise calls will be added to the display list
  callDisplayMap.clear();
  checkList = true;
  callEngineStream.sink.add(callDisplayMap);
  checkList = false;
  //Create a map for all call types
  Map<DateTime, Alert> emg = {}, call = {}, ass = {}, att = {}, acc = {}, cC = {};
  liveCallStack.forEach((key, value) {
    // print("Key $key - Value${value.toJson()}");
    if(value.alertType != "3" && value.alertType != "7"){
      switch(value.alertType){
        case "1":{
          emg[value.alertTime] = value;
        }break;
        case "2":{
          call[value.alertTime] = value;
        }break;
        case "4":{
          ass[value.alertTime] = value;
        }break;
        case "5":{
          att[value.alertTime] = value;
        }break;
        case "6":{
          acc[value.alertTime] = value;
        }break;
        default:{
          cC[value.alertTime] = value;
        }break;
      }
    }
  });
  emg = SplayTreeMap<DateTime, Alert>.from(emg, (k1, k2)=> k1.compareTo(k2));
  call = SplayTreeMap<DateTime, Alert>.from(call, (k1, k2)=> k1.compareTo(k2));
  ass = SplayTreeMap<DateTime, Alert>.from(ass, (k1, k2)=> k1.compareTo(k2));
  acc = SplayTreeMap<DateTime, Alert>.from(acc, (k1, k2)=> k1.compareTo(k2));
  att = SplayTreeMap<DateTime, Alert>.from(att, (k1, k2)=> k1.compareTo(k2));
  cC = SplayTreeMap<DateTime, Alert>.from(cC, (k1, k2)=> k1.compareTo(k2));
  callDisplayMap.addAll(emg.values);
  callDisplayMap.addAll(ass.values);
  callDisplayMap.addAll(acc.values);
  callDisplayMap.addAll(call.values);
  callDisplayMap.addAll(cC.values);
  callDisplayMap.addAll(att.values);
  //Adding a timer will give the UI enough time to update the display
  Timer(const Duration(milliseconds: 100), () {
    //Add to display screen
    callEngineStream.sink.add(callDisplayMap);
    //Add to server stream
    // serverCallStream.sink.add(callDisplayMap);
    sockets.forEach((key, value) {
      value.add(callDisplayMap);
    });

  });
}

//Call Filter iterates over current call stack to see if the new call will replace the current cal
void callFilter(Unit callData, Alert newAlert){
  DateTime now = DateTime.now();
  if(newAlert.alertType == "3"){
    Alert oldAlert = liveCallStack[callData.txid]!;
    liveCallStack[callData.txid] = newAlert;
    CallData cr = CallData(null, oldAlert.callPointId, oldAlert.alertType, oldAlert.alertTime, now, now.difference(oldAlert.alertTime).inSeconds,newAlert.alertType, "carer", oldAlert.alertUuid, oldAlert.alertTime.day, oldAlert.alertTime.month, oldAlert.alertTime.year, "serverRef", oldAlert.zone, oldAlert.room, newAlert.alertUuid);
    saveCallToLocalDB(cr);
    // final CallRecord cr = CallRecord(alertType: oldAlert.alertType, zone: zone, room: room, dbRef: dbRef, alertTime: alertTime, txCode: txCode)
  }else{
    Alert oldAlert = liveCallStack[callData.txid]!;
    bool oldAlertReplaced = false;
    if(newAlert.alertType != oldAlert.alertType){
      switch(oldAlert.alertType){
        case "1":{
          if(newAlert.alertType == "4" || newAlert.alertType == "5"){
            liveCallStack[callData.txid] = newAlert;
            oldAlertReplaced = true;
          }
        }break;
        case "4":{
          if(newAlert.alertType != "2" && newAlert.alertType != "6" && newAlert.alertType != "7" && newAlert.alertType != "8"){
            liveCallStack[callData.txid] = newAlert;
            oldAlertReplaced = true;
          }
        }break;
        case "6":{
          if(newAlert.alertType != "2"){
            liveCallStack[callData.txid] = newAlert;
            oldAlertReplaced = true;
          }
        }break;
        default: {
          liveCallStack[callData.txid] = newAlert;
          oldAlertReplaced = true;
        }break;
      }
    }
    //Save Old alert to database
    if(oldAlertReplaced){
      CallData cr = CallData(null, oldAlert.callPointId, oldAlert.alertType, oldAlert.alertTime, now, now.difference(oldAlert.alertTime).inSeconds,newAlert.alertType, "carer", oldAlert.alertUuid, oldAlert.alertTime.day, oldAlert.alertTime.month, oldAlert.alertTime.year, "serverRef", oldAlert.zone, oldAlert.room, newAlert.alertUuid);
      saveCallToLocalDB(cr);
    }
  }
  callEngineStep2();
}

void handleRemoteCall(String data){
  List callData = data.split(".");
  String roomCode = callData[0];
  if(configMapTesting.containsKey(roomCode)){
    Unit callingUnit = configMapTesting[roomCode]!;
    // debugPrint(callingUnit.toJson().toString());
    //Pass in 'B' for a remote call as we are not measuring the battery level
    callEngineStep1(callingUnit, callData[1], data, 'B');
  }else{
    //Need to add database for un-configured units
    debugPrint("Not In Config");
  }
}

void handlePhoneData(var data){
  //Calls coming from the carer phone handset
  print(data);
}

//This is used to determine what track is needed to play for the alert type
Future<int> getPlayerIndex(String alertType)async{
  switch(alertType){
    case "1":{
      return 0;
    }
    case "2":{
      return 1;
    }
    case "4":{
      return 2;
    }
    case "5":{
      return 3;
    }
    default:{
      return 4;
    }
  }
}

void saveCallToLocalDB(CallData cr)async{
  CallDataBaseHelper().saveCall(cr);
}


