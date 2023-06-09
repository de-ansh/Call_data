
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:arquella_hub/data/calls/engine/usb_connection.dart';
import 'package:usb_serial/usb_serial.dart';

import '../../interface/dashboard.dart';
import '../database/error_records.dart';

UsbPort? _usbPort;
List<int> usbData = [];
bool addToUsbData = false;

void connectUSB()async{
  List<UsbDevice> devices = await UsbSerial.listDevices();
  if(devices.isNotEmpty){
    _usbPort = await devices[0].create();
    await _usbPort?.open();
    await _usbPort?.setDTR(true);
    await _usbPort?.setRTS(true);
    await _usbPort?.setPortParameters(9600, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);
    _usbPort?.inputStream?.listen((event) {
      for(int el in event){
        if(el == 123){
          usbData.clear();
          addToUsbData = true;
          usbData.add(el);
        }else if(el >= 46 && el <= 57){
          if(addToUsbData == true){ usbData.add(el); }
        }else if (el >= 97 && el <= 108){
          if(addToUsbData == true){ usbData.add(el); }
        }else if(el == 125){
          usbData.add(el);
          addToUsbData = false;
          if(usbData.length > 11){
            usbProcessor(usbData);
          }
          usbData.clear();
          // secondStageProcess(usbData);
        }
      }
      // print("USB Data - $event");

    }, onDone: (){}, onError: (e){saveError("$e - ${DateTime.now().toUtc().toIso8601String()}");});
  }
}

void retransmit(String signal)async{
  Uint8List signal2 = utf8.encode(signal) as Uint8List;
  _usbPort!.write(signal2);
  // Timer(Duration(seconds: 1), () {_usbPort!.write(signal2);});
}

void usbListener(){
  UsbSerial.usbEventStream!.listen((UsbEvent msg) {
    DateTime dt = DateTime.now().toUtc();
    if(msg.event == UsbEvent.ACTION_USB_ATTACHED){
      saveError("Usb re-attached - ${dt.toIso8601String()}");
      notificationList.clear();
      connectUSB();
    }
    if(msg.event == UsbEvent.ACTION_USB_DETACHED){
      debugPrint("Usb detached");
      _usbPort!.close();
      saveError("Usb detached - ${dt.toIso8601String()}");
      notificationList.add(MaterialBanner(content: Text("Usb Detached - ${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}"), actions: const [],));
      notifications.sink.add("Usb Detached");
    }
  });
}