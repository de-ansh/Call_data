
import 'dart:io';

import 'package:arquella_hub/server/local/websocket.dart';

void handleGetData(HttpRequest event)async{
  switch(event.requestedUri.path){
    case "/":{
      return sendData(event);
    }
    case "/socket":{
      return webSocketUpgrade(event);
    }
    default:{
      return sendData(event);
    }
  }
}

void sendData(HttpRequest event)async{
  event.response.write("Connected");
  event.response.close();
}

