import 'package:flutter/material.dart';
import 'package:arquella_hub/data/database/database_helper.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final messages = await _databaseHelper.getMessages();
    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (BuildContext context, int index) {
          final message = _messages[index];
          return ListTile(
            title: Text('Client ID: ${message['clientId']}'),
            subtitle: Text('IP: ${message['clientIp']}'),
            trailing: Text('Data: ${message['data']}'),
          );
        },
      ),
    );
  }
}
