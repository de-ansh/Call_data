import 'package:arquella_hub/data/database/call_database.dart';
import 'package:arquella_hub/view/add_call.dart';
import 'package:flutter/material.dart';
import 'package:arquella_hub/server/websocket_server.dart';
import 'package:arquella_hub/data/database/database_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebSocket Server',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/database': (context) => const DatabaseScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WebSocketServer _webSocketServer = WebSocketServer();
  bool _isServerRunning = false;

  @override
  void dispose() {
    _webSocketServer.stopServer();
    super.dispose();
  }

  void _toggleServerStatus() {
    setState(() {
      _isServerRunning = !_isServerRunning;
    });

    if (_isServerRunning) {
      _webSocketServer.startServer();
    } else {
      _webSocketServer.stopServer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WebSocket Server'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isServerRunning ? 'Server Running' : 'Server Stopped',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleServerStatus,
                child: Text(_isServerRunning ? 'Stop Server' : 'Start Server'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/database');
                },
                child: const Text('View Database'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CallDataBase()));
                },
                child: const Text('View Call Database'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddCallPage()),
            );
          },
          tooltip: 'Add Call',
          child: const Icon(Icons.add),
        ));
  }
}
