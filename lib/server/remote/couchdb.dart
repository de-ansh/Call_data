import 'dart:convert';

import 'package:couchdb_dart/couchdb_dart.dart';
import 'package:http/http.dart' as http;

const username = 'Lloyd';

const password = 'Lloyd39lloyd39';

String endPoint = "_all_dbs";

String dbAddress = "https://$username:$password@database.l39.tech:6984/";

Uri uri = Uri.parse("https://$username:$password@database.l39.tech:6984/$endPoint");

final client = CouchDbClient.fromUri(uri);

final database = Database(client, 'l39');

void connectToDB()async{
  var resp = await http.get(uri);
  print(resp.body);
  saveTestData();
}

void saveTestData()async{
  String ep = "arquella";
  Map data = {'title': 'Test data', 'timestamp': DateTime.now().toIso8601String()};
  Uri url = Uri.parse(dbAddress + ep);
  var resp = await http.post(url, body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
  print(resp.body);
  listenToDB();
}

void listenToDB()async{
  String ep = "arquella/_changes?feed=continuous";
  Uri url = Uri.parse(dbAddress + ep);
  final request = http.Request("GET", url);
  request.send().then((value){
    value.stream.listen((data) {
      print("Data received");
      print(String.fromCharCodes(data));
    });
  });
}