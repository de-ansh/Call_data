import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:arquella_hub/data/calls/engine/call_engine.dart';

Map<int, WebSocket> sockets = {};
StreamSubscription? webSocketListener;
StreamController serverCallStream = StreamController.broadcast();

void webSocketUpgrade(HttpRequest event)async{
  WebSocketTransformer.upgrade(event).then((value){
    sockets[sockets.length] = value;
    value.add(jsonEncode(callDisplayMap));
    value.listen((event) {
      webSocketClientData(event);
    });
  }, onError: (e){
    print(e);
  });
}

void webSocketBroadcast()async{
  sockets.forEach((key, value) {
    int connState = value.readyState;
    if(connState == 1){
      value.add(jsonEncode(callDisplayMap));
    }else if(connState == 0){

    }else{
      sockets.remove(key);
    }
  });
}

//Data structure for websocket connection is a map with one entry and the key is the identifier
// ie {callData: "001.1"}
Future<void> webSocketClientData(String event)async{
  Map m = jsonDecode(event);
  print(event);
  if(m.containsKey("callData")){
    return handleRemoteCall(m["callData"]);
  }else{

  }
}

void closeWebSocket()async{

}