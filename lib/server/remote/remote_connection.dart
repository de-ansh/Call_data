import 'dart:convert';

import 'package:arquella_hub/data/calls/engine/call_engine.dart';
import 'package:arquella_hub/data/system/config/config.dart';
import 'package:socket_io_client/socket_io_client.dart' as arqs;


class ArquellaServerConnection{
  arqs.Socket? socket;

  void connect(){
    socket = arqs.io('http://portal.arquel.la', arqs.OptionBuilder().setTransports(['websocket']).build());
    socket!.onConnect((data) => initialConnection());
    socket!.onDisconnect((data) => handleDisconnect());
    socket!.onConnectError((data) => handleConnectErr());
    socket!.onConnectTimeout((data) => handleTimeOut());
    socket!.onAny((event, data) => handleMessage(event, data));
  }

  void initialConnection(){
    Map object = {
      "panelId": "Test panel"
    };
    socket!.emit('Connected', jsonEncode(object));
  }

  void handleDisconnect(){
    print("Disconnected");
  }

  void handleConnectErr(){
    print("Connection error");
  }

  void handleTimeOut(){
    print("Connection timeout");
  }

  void unknownMsg(var data){
    print("Unknown message data");
    print(data);
  }

  //Server subjects to listen to:
  //Config
  //Remote call
  //Care call
  //Sound
  //Maintenance
  //Staff Config

  Future<void> handleMessage(String event, var data)async{
    switch(event){
      case "config":{
        return PanelConfigEngine().remoteUpdate(data);
      }
      case "remote call":{
        return handleRemoteCall(data);
      }
      case "care call":{
        return handleRemoteCall(data);
      }
      case "sound":{
        return unknownMsg(data);
      }
      case "maintenance":{
        return unknownMsg(data);
      }
      case "staff config":{
        return unknownMsg(data);
      }
      default:{
        return unknownMsg(data);
      }
    }
  }
}

