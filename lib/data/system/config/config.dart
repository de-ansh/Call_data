

import 'dart:convert';

import 'data.dart';

class PanelConfigEngine{
  Map<String, Unit> configMap = {};

  Map<String, String> notConfiguredUnits = {};

  void remoteUpdate(String data){
    Map m = jsonDecode(data);
    print(m);
  }
}