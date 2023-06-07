
import 'dart:async';

import 'package:just_audio/just_audio.dart';

AudioPlayer player = AudioPlayer();
AudioPlayer callPlayer = AudioPlayer();
AudioPlayer emgPlayer = AudioPlayer();
AudioPlayer assistPlayer = AudioPlayer();
AudioPlayer accessoryPlayer = AudioPlayer();
String soundAsset = 'assets/OneSecond.mp3';

//Set separate sound indicators so they can be changed later to custom tracks
String emgSound = 'assets/emergency.mp3';
String callSound = 'assets/OneSecond.mp3';
String assSound = 'assets/HalfSecond.mp3';
String accSound = 'assets/QuarterSecond.mp3';
String doorbell = '/assets/doorbell.mp3';

double emgVolume = 1.0, callVolume = 1.0, assVolume = 1.0, accVolume = 1.0;

double playerVolume = 1.0;

final playList = ConcatenatingAudioSource(children: [
  AudioSource.uri(Uri.parse("asset:///assets/emergency.mp3")),
  AudioSource.uri(Uri.parse("asset:///assets/OneSecond.mp3")),
  AudioSource.uri(Uri.parse("asset:///assets/HalfSecond.mp3")),
  AudioSource.uri(Uri.parse("asset:///assets/QuarterSecond.mp3")),
  AudioSource.uri(Uri.parse("asset:///assets/doorbell.mp3")),
]);

Timer? playTimer;
int delayAmount = 8;

void initPlayer2()async{
  await player.setAudioSource(playList);
  player.playbackEventStream.listen((event) {

  }, onError: (e){print(e);}, onDone: (){print("Player done");});
  // player.processingStateStream.listen((event) {
  //   if(event == ProcessingState.completed){
  //     print("Sound completed");
  //
  //   }
  // });
  // player.sequenceStateStream.listen((event) {
  //   print("Current Index ${event!.currentIndex}");
  // });
  // player.positionDiscontinuityStream.listen((event) {
  //   print(event.reason);
  //   if(event.reason == PositionDiscontinuityReason.autoAdvance){
  //
  //   }
  // });
}

void playSound2(String alertType)async{
  if(alertType != "5"){
    player.seek(Duration.zero, index: int.parse(alertType));
    // player.setVolume(volume);
    player.play();
    player.setLoopMode(LoopMode.one);
  }else{
    stopPlayer2();
  }

}

void stopPlayer2()async{
  if(player.playing){
    player.stop();
  }
}
