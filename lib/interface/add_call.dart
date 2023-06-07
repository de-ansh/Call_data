import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:arquella_hub/model/call_model.dart';
import 'package:arquella_hub/widgets/new_item.dart';

StreamController notifications = StreamController.broadcast();

List<MaterialBanner> notificationList = [];

class AddCall extends StatefulWidget {
  const AddCall({Key? key}) : super(key: key);

  @override
  State<AddCall> createState() => _AddCall();
}

class _AddCall extends State<AddCall> {
  // ignore: unused_field
  List<CallList> callPage = [];
  void _loadItems() async {
    final url = Uri.http('10.0.2.2:3007', 'call/addcall');
    final response = await http.post(url,
        body: jsonEncode(<String, String>{
          'careHomeName': 'mahindra1',
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjEsImVtYWlsIjoidGVzdEBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlhdCI6MTY4NTAxMDQyNSwiZXhwIjoxNzE2NTY4MDI1fQ.nKyff1kO4J-vkd6Lq2gpymoFRpJi7wmCbo-xwkA3ZuE',
        });

    if (kDebugMode) {
      print(response.body);
    }
    final Map listData = json.decode(response.body);
    final List<CallList> loadedItems = [];
    for (final item in listData['data']['callHistories']) {
      loadedItems.add(CallList(
          callRoom: item['cll_room'],
          callType: item['cll_type'],
          duration: item['cll_duration'],
          callZone: item['cll_zone']));
    }
    setState(() {
      callPage = loadedItems;
    });
  }

  void _addItem() async {
    await Navigator.of(context).push<CallList>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    _loadItems();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No calls isssn log.'));

    if (callPage.isNotEmpty) {
      content = ListView.builder(
        itemCount: callPage.length,
        itemBuilder: (ctx, index) => ListTile(
          title:
              Text("${callPage[index].callRoom}  ${callPage[index].callZone}"),
          trailing: Text(
            "${callPage[index].callType} ${callPage[index].duration} seconds",
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Logs'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: Column(children: [
        ElevatedButton(onPressed: _loadItems, child: const Text('Fetch calls')),
        SizedBox(
          width: double.infinity,
          height: 600,
          child: content,
        )
      ]),
    );
  }
}
