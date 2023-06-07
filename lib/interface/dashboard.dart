import 'dart:async';

import 'package:arquella_hub/calls/call_view.dart';
import 'package:arquella_hub/calls/default_view.dart';
import 'package:arquella_hub/data/calls/engine/call_engine.dart';
import 'package:arquella_hub/data/time/time_data.dart';
import 'package:arquella_hub/data/usb/interface.dart';
import 'package:arquella_hub/server/local/server.dart';
// import 'package:arquella_hub/server/remote/remote_connection.dart';
import 'package:arquella_hub/sound_player/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../data/calls/data.dart';
import '../data/system/config/data.dart';

StreamController notifications = StreamController.broadcast();

List<MaterialBanner> notificationList = [];

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  StreamSubscription? callStackListener;
  String addressForQR = "";

  void startUpProcess() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    systemChange(false);
    SystemChrome.setSystemUIChangeCallback(
        (systemOverlaysAreVisible) => systemChange(systemOverlaysAreVisible));
    //Start up sounds player
    initPlayer2();
    //Timer for call duration display
    startTimer();
    //Connect to usb receiver
    connectUSB();
    //Listen for usb being unplugged
    usbListener();
    notifications.stream.listen((event) {
      String message = event as String;
      debugPrint(message);
      // warningMessage(context, message);
      if (notificationList.isNotEmpty) {
        ScaffoldMessenger.of(context).clearMaterialBanners();
      } else {
        ScaffoldMessenger.of(context).showMaterialBanner(notificationList[0]);
      }
    });
  }

  Future<void> systemChange(data) async {
    //Check if screen lock is set
    if (screenLocked) {
      //If UI becomes visible re-set to invisible
      if (!data) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      }
    }
  }

  @override
  void initState() {

    super.initState();
    startUpProcess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: callEngineStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Alert> callList = snapshot.data as List<Alert>;
              if (callList.isEmpty) {
                //Check if the call list is actually empty before stopping player
                if (!checkList) {
                  stopPlayer2();
                }
                return const Default();
              } else {
                return CallView(callList: callList);
              }
            } else {
              return const Default();
            }
          }),
    //  floatingActionButton: FutureBuilder(
          //This future will start the local server
        //  future: startLocalServer(),
         // builder: (context, snapshot) {
           // if (snapshot.hasData) {
             // addressForQR = snapshot.data as String;
             // debugPrint(addressForQR);
             // return QrImage(
              //  data: snapshot.data as String,
               // size: 75,
             // );
            //} else {
              //return QrImage(
               // data: addressForQR,
               // size: 75,
             // );
           // }
         // }),
    );
  }
}
