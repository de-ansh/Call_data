import 'dart:async';
import 'dart:io';

import 'package:arquella_hub/server/local/get.dart';
import 'package:arquella_hub/server/local/post.dart';
import 'package:flutter/material.dart';

HttpServer? arquellaServer;
String arquellaServerAddress = "";
InternetAddress? address;
StreamSubscription? webRequests;

Future<String> startLocalServer()async{
  for(var interface in await NetworkInterface.list()){
    for(var a in interface.addresses){
      address = InternetAddress(a.address);
      arquellaServerAddress = a.address;
    }
  }
  arquellaServer = await HttpServer.bind(address, 3939);
  webRequests = arquellaServer!.listen((event) {
    if(event.method == 'POST'){
      handlePostData(event);
    }else{
      handleGetData(event);
    }
  });

  return arquellaServerAddress;
}

