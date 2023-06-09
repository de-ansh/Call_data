import 'package:arquella_hub/model/db/appdb.dart';
import 'package:arquella_hub/view/edit_call.dart';
import 'package:flutter/material.dart';

class CallDataBase extends StatefulWidget {
  const CallDataBase({super.key});

  @override
  State<CallDataBase> createState() => _CallDataBaseState();
}

class _CallDataBaseState extends State<CallDataBase> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Call DataBase",
            style: TextStyle(fontSize: 23),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<CallTableData>>(
          future: _db.getCalls(),
          builder: (context, snapshot) {
            final List<CallTableData>? calls = snapshot.data;
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (calls != null) {
              return ListView.builder(
                  itemCount: calls.length,
                  itemBuilder: (context, index) {
                    final call = calls[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCallPage(
                              id: call.callId,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.grey.shade50,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.green,
                              width: 1.2,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Call Id : ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    call.callId.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Call Start Date: ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    call.cll_start_date.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Call End Date: ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    call.cll_end_date.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Care Home Id: ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    call.careHome_id,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Call Carer: ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    call.cll_carer.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Call Duration: ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    call.cll_duration.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const Text("No Data Found");
          },
        ),
      ),
    );
  }
}
