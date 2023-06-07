import 'dart:convert';
import 'dart:io';

import 'package:arquella_hub/data/calls/engine/call_engine.dart';

void handlePostData(HttpRequest event)async{
  switch(event.requestedUri.path){
    case "/login":{
      return login(event);
    }
    case "/careClick":{
      return careClick(event);
    }
    case "/call":{
      return handlePhoneData(event);
    }
    case "/newCarer":{
      return createCarer(event);
    }
    case "/newResident":{
      return createResident(event);
    }
    case "/roomUnit":{
      return unitCall(event);
    }
    default:{
      return sendData(event);
    }
  }
}

void sendData(HttpRequest event)async{

}

void careClick(HttpRequest event)async{

}

void login(HttpRequest event)async{
  print("Logging in");

}

void createCall(HttpRequest event)async{

}

void createCarer(HttpRequest event)async{

}

void createResident(HttpRequest event)async{

}

void soundManagement(HttpRequest event)async{

}

void unitCall(HttpRequest event)async{
  Map m = event.uri.queryParameters;
  event.listen((ev) {
    print(ev);
    List<int> chars = ev;
    String toString = String.fromCharCodes(chars);
    print(toString);
    Map map = jsonDecode(toString);
    handleRemoteCall(map["call"]);
  });
  print(m);
  // handleRemoteCall(m["call"]);
  event.response.write("Received");
  event.response.close();
}