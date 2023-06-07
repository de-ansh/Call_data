// import 'package:arquella_hub/interface/dashboard.dart';
import 'dart:convert';

import 'package:arquella_hub/interface/socket.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'interface/call_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo info = await deviceInfo.androidInfo;
  if (kDebugMode) {
    print(info.version);
    print(info.board);
    print(info.id);
    print(info.brand);
    print(info.device);
  }

  var request = http.Request(
    'GET',
    Uri.parse("https://app.eov.arquel.la/config/getlicense"),
  )..headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjEsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2ODU2ODA5NTYsImV4cCI6MTcxNzIzODU1Nn0.Ry8LfJRfSt4XxW4R0ESsxpZhFqKr3_aNGfPywXxxjiU',
    });
  var params = {
    'androidLicense_id': '1wees1a:60',
  };
  request.body = jsonEncode(params);
  http.StreamedResponse response = await request.send();

  if (kDebugMode) {
    print(response.statusCode);
    print(await response.stream.bytesToString());
  }

  runApp(const ArquellaApp());
}

class ArquellaApp extends StatelessWidget {
  const ArquellaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Arquella Hub",
        // home: CallPage(),
        home: MyApp());
  }
}
