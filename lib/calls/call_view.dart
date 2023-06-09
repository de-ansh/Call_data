import 'package:arquella_hub/data/calls/useful.dart';
import 'package:arquella_hub/data/system/config/test_config.dart';
import 'package:arquella_hub/data/time/time_data.dart';
import 'package:arquella_hub/sound_player/player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../data/calls/data.dart';

class CallView extends StatefulWidget {
  final List<Alert> callList;
  const CallView({Key? key, required this.callList}) : super(key: key);

  @override
  State<CallView> createState() => _CallViewState();
}

class _CallViewState extends State<CallView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.callList.length,
        itemBuilder: (context, index){
        Alert alert = widget.callList[index];
        Color bgGround = getCallColor(alert.alertType);
        Color textColor = getTextColor(alert.alertType);
          if(index == 0){
            String soundIndex = "0";
            switch(alert.alertType) {
              case "1":
                {
                  soundIndex = "0";
                }
                break;
              case "2":
                {
                  soundIndex = "1";
                }
                break;
              case "4":
                {
                  soundIndex = "2";
                }
                break;
              case "6":
                {
                  soundIndex = "3";
                }
                break;
              default:
                {
                  soundIndex = "5";
                }
                break;
            }
            playSound2(soundIndex);
            //First alert is the larger call display for the Hub screen
            return FirstAlert(alert: alert);
          }else{
            return ListTile(
              shape: const Border(bottom: BorderSide(width: 2.0)),
              tileColor: bgGround,
              leading: Image.asset(getImagePath(alert.alertType)),
              title: Text(alert.room, style: TextStyle(color: textColor, fontWeight: FontWeight.bold), textScaleFactor: 2.0,),
              subtitle: Text(zoneConfigTesting[alert.zone]!, style: TextStyle(color: textColor), textScaleFactor: 1.5,),
              trailing: TimerWidget(alert: alert, data: {"size": 2.0, "color": textColor}),
            );
          }
        }
    );
  }
}

class FirstAlert extends StatefulWidget {
  final Alert alert;
  const FirstAlert({Key? key, required this.alert}) : super(key: key);

  @override
  State<FirstAlert> createState() => _FirstAlertState();
}

class _FirstAlertState extends State<FirstAlert> {
  Color textColor = Colors.white;
  String alertText = "CALL";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch(widget.alert.alertType){
      case "1":{
        alertText = "EMERGENCY";
      }break;
      case "4":{
        textColor = assistanceAlertTextColor;
        alertText = "ASSISTANCE";
      }break;
      case "5":{
        textColor = alertTextColor;
        alertText = "ATTENDANCE";
      }break;
      case "6":{
        alertText = "ACCESSORY";
      }break;
      case "8":{
        alertText = "CARE CALL";
      }break;
      default:{
        textColor = alertTextColor;
      }break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: getCallColor(widget.alert.alertType),
        border: Border.all(width: 2.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0, left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(alertText),
                const Spacer(),
                Icon(widget.alert.batteryLow ? Icons.battery_alert_outlined : Icons.battery_std, color: textColor,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(getImagePath(widget.alert.alertType),height: 200, width: 200,),
                ),
                Expanded(
                  flex: 7,
                    child: Column(
                      children: [
                        AutoSizeText(widget.alert.room, style: TextStyle(fontSize: 200.0, color: textColor ), maxLines: 1,),
                        AutoSizeText(zoneConfigTesting[widget.alert.zone]!, style: TextStyle(fontSize: 80.0, color: textColor), maxLines: 1,),
                      ],
                    )
                ),
                const Expanded(
                  flex: 1,
                    child: Text("")
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0, right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TimerWidget(alert: widget.alert, data: {"size": 5.0, "color": textColor},),
              ],
            ),
          )
        ],
      )
    );
  }
}

String getImagePath(String callType) {
  switch(callType){
    case "1":{
      return "assets/care_icons/emergency.png";
    }
    case "4":{
      return "assets/care_icons/assisIcon.png";
    }
    case "5":{
      return "assets/care_icons/attenIcon.png";
    }
    case "6":{
      return "assets/care_icons/accIcon.png";
    }
    case "8":{
      return "assets/care_icons/aida_care.png";
    }
    default:{
      return "assets/care_icons/callIcon.png";
    }
  }
}

Color getTextColor(String callType){
  switch(callType){
    case "4":{
      return assistanceAlertTextColor;
    }
    case "5":{
      return alertTextColor;
    }
    default:{
      return Colors.white;
    }
  }
}

Color getCallColor(String callType){
  switch(callType){
    case "1":{
      return emgColor;
    }
    case "4":{
      return assColor;
    }
    case "5":{
      return attColor;
    }
    case "6":{
      return accColor;
    }
    case "8":{
      return careColor;
    }
    default:{
      return callColor;
    }
  }
}
