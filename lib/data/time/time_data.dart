import 'dart:async';

import 'package:flutter/material.dart';

import '../calls/data.dart';

StreamController timeStream = StreamController.broadcast();
Timer? secondsTimer;

void startTimer(){
  secondsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    timeStream.sink.add(DateTime.now());
  });
}

void stopTimer(){
  if(secondsTimer != null){
    secondsTimer!.cancel();
  }
}

class TimerWidget extends StatefulWidget {
  final Alert alert;
  final Map data;
  const TimerWidget({Key? key, required this.alert, required this.data}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  String timeNow = "00:00:00";
  StreamSubscription? st;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    st!.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    st = timeStream.stream.listen((event) {
      DateTime eventTime = event as DateTime;
      Duration diff = eventTime.difference(widget.alert.alertTime);
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      String twoDigitMinutes = twoDigits(diff.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(diff.inSeconds.remainder(60));
      setState(() {
        timeNow = "${twoDigits(diff.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(timeNow, style: TextStyle(color: widget.data['color']), textScaleFactor: widget.data['size'],);
  }
}