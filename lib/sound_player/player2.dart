import 'dart:async';

import 'package:just_audio/just_audio.dart';

AudioPlayer callPlayer = AudioPlayer();
AudioPlayer emgPlayer = AudioPlayer();
AudioPlayer assistPlayer = AudioPlayer();
AudioPlayer accessoryPlayer = AudioPlayer();

bool advancedSoundsActive = false;

int soundCount = 0;

bool playing = false;

void playCall()async{
  await callPlayer.stop();
  await callPlayer.setAsset('assets/OneSecond.mp3');
  callPlayer.play();
}

void playEmg()async{
  await emgPlayer.stop();
  await emgPlayer.setAsset('assets/emergency.mp3');
  emgPlayer.play();
}

void playAssist()async{
  await assistPlayer.stop();
  await assistPlayer.setAsset('assets/HalfSecond.mp3');
  assistPlayer.play();
}

void playAccessory()async{
  await accessoryPlayer.stop();
  await accessoryPlayer.setAsset('assets/QuarterSecond.mp3');
  accessoryPlayer.play();
}

void soundSorter(String a){
  switch (a){
    case "1":{
      if(soundCount > 3){
        soundCount = 0;
        playEmg();
      }
    }break;
    case "2":{
      if(soundCount > 8){
        soundCount = 0;
        playCall();
      }
    }break;
    case "4":{
      if(soundCount > 8){
        soundCount = 0;
        playAssist();
      }
    }break;
    case "5":{
      if(soundCount > 8){
        soundCount = 0;
      }
    }break;
    case "6":{
      if(soundCount > 8){
        soundCount = 0;
        playAccessory();
      }
    }break;
    case "8":{
      if(soundCount > 8){
        soundCount = 0;
      }
    }break;
    default:{
      if(soundCount > 8){
        soundCount = 0;
      }
    }break;
  }
}

void stopPlayer(){
  if(emgPlayer.playing){
    emgPlayer.stop();
  }
  if(callPlayer.playing){
    callPlayer.stop();
  }
  if(assistPlayer.playing){
    assistPlayer.stop();
  }
  if(accessoryPlayer.playing){
    accessoryPlayer.stop();
  }
}

void initialSound(String a){
  // print("initial Sound");
  switch (a){
    case "1":{
      playEmg();
    }break;
    case "2":{
      // print("Call Playing");
      playCall();
    }break;
    case "4":{
      playAssist();
    }break;
    case "5":{

    }break;
    case "6":{
      playAccessory();
    }break;
    case "8":{

    }break;
    default:{

    }break;
  }
}

void setEmgVolume(double volume){
  emgPlayer.setVolume(volume);
}

void setCallVolume(double volume){
  callPlayer.setVolume(volume);
}

void setAssistVolume(double volume){
  assistPlayer.setVolume(volume);
}

void setAccessoryVolume(double volume){
  accessoryPlayer.setVolume(volume);
}

Timer? advancedTimer;

// AdvancedSoundMap? daySound, prevDay;
//
// void advancedSoundTrigger(){
//   print("Advanced sound trigger");
//   if(advancedTimer != null){
//     if(advancedTimer!.isActive){
//       advancedTimer!.cancel();
//     }
//   }
//   DateTime dtNow = DateTime.now().toUtc();
//   DateTime? dd, nd;
//   switch(dtNow.weekday){
//     case 1:{
//       TimeOfDay d = panelAdvancedSounds.monday.day;
//       TimeOfDay n = panelAdvancedSounds.monday.night;
//       daySound = panelAdvancedSounds.monday;
//       prevDay = panelAdvancedSounds.sunday;
//       dd = DateTime(dtNow.year, dtNow.month, dtNow.day, d.hour, d.minute);
//       nd = DateTime(dtNow.year, dtNow.month, dtNow.day, n.hour, n.minute);
//     }break;
//     case 2:{
//       TimeOfDay d = panelAdvancedSounds.tuesday.day;
//       TimeOfDay n = panelAdvancedSounds.tuesday.night;
//       daySound = panelAdvancedSounds.tuesday;
//       prevDay = panelAdvancedSounds.monday;
//       dd = DateTime(dtNow.year, dtNow.month, dtNow.day, d.hour, d.minute);
//       nd = DateTime(dtNow.year, dtNow.month, dtNow.day, n.hour, n.minute);
//     }break;
//     case 3:{
//       TimeOfDay d = panelAdvancedSounds.wednesday.day;
//       TimeOfDay n = panelAdvancedSounds.wednesday.night;
//       daySound = panelAdvancedSounds.wednesday;
//       prevDay = panelAdvancedSounds.tuesday;
//       dd = DateTime(dtNow.year, dtNow.month, dtNow.day, d.hour, d.minute);
//       nd = DateTime(dtNow.year, dtNow.month, dtNow.day, n.hour, n.minute);
//     }break;
//     case 4:{
//       TimeOfDay d = panelAdvancedSounds.thursday.day;
//       TimeOfDay n = panelAdvancedSounds.thursday.night;
//       daySound = panelAdvancedSounds.thursday;
//       prevDay = panelAdvancedSounds.wednesday;
//       dd = DateTime(dtNow.year, dtNow.month, dtNow.day, d.hour, d.minute);
//       nd = DateTime(dtNow.year, dtNow.month, dtNow.day, n.hour, n.minute);
//     }break;
//     case 5:{
//       TimeOfDay d = panelAdvancedSounds.friday.day;
//       TimeOfDay n = panelAdvancedSounds.friday.night;
//       daySound = panelAdvancedSounds.friday;
//       prevDay = panelAdvancedSounds.thursday;
//       dd = DateTime(dtNow.year, dtNow.month, dtNow.day, d.hour, d.minute);
//       nd = DateTime(dtNow.year, dtNow.month, dtNow.day, n.hour, n.minute);
//     }break;
//     case 6:{
//       TimeOfDay d = panelAdvancedSounds.saturday.day;
//       TimeOfDay n = panelAdvancedSounds.saturday.night;
//       daySound = panelAdvancedSounds.saturday;
//       prevDay = panelAdvancedSounds.friday;
//       dd = DateTime(dtNow.year, dtNow.month, dtNow.day, d.hour, d.minute);
//       nd = DateTime(dtNow.year, dtNow.month, dtNow.day, n.hour, n.minute);
//     }break;
//     case 7:{
//       TimeOfDay d = panelAdvancedSounds.sunday.day;
//       TimeOfDay n = panelAdvancedSounds.sunday.night;
//       daySound = panelAdvancedSounds.sunday;
//       prevDay = panelAdvancedSounds.saturday;
//       dd = DateTime(dtNow.year, dtNow.month, dtNow.day, d.hour, d.minute);
//       nd = DateTime(dtNow.year, dtNow.month, dtNow.day, n.hour, n.minute);
//     }break;
//   }
//   advancedSoundStep2(dtNow, dd!, nd!, daySound!, prevDay!);
// }
//
// void advancedSoundStep2(DateTime dtNow, DateTime dd, DateTime nd, AdvancedSoundMap daySound, AdvancedSoundMap prevDay){
//   //Time is before day start
//   if(dtNow.isBefore(dd)){
//     Duration diff = dtNow.difference(dd);
//     advancedSetSounds(false, prevDay);
//     advancedTimer = Timer(Duration(seconds: diff.inSeconds), () {
//       //Activate day sound
//       advancedSoundTrigger();
//
//     });
//   }else{
//     //Time is after day start
//     if(dtNow.isBefore(nd)){
//       Duration diff = dtNow.difference(nd);
//       advancedSetSounds(true, daySound);
//       advancedTimer = Timer(Duration(seconds: diff.inSeconds), () {
//         //Activate night sound
//         advancedSoundTrigger();
//       });
//     }else{
//       //Time is after day start and after night start
//       TimeOfDay d = daySound.day;
//       DateTime dd2 = DateTime(dtNow.year, dtNow.month, dtNow.day, d.hour, d.minute);
//       Duration diff = dtNow.difference(dd2);
//       advancedSetSounds(false, daySound);
//       advancedTimer = Timer(Duration(seconds: diff.inSeconds), () {
//         //Activate day sound
//         advancedSoundTrigger();
//       });
//     }
//   }
// }
//
// void advancedSetSounds(bool day, AdvancedSoundMap daySound)async{
//   if(day){
//     emgPlayer.setVolume(daySound.emgV);
//     callPlayer.setVolume(daySound.callV);
//     assistPlayer.setVolume(daySound.assV);
//     accessoryPlayer.setVolume(daySound.accV);
//   }else{
//     emgPlayer.setVolume(daySound.emgVN);
//     callPlayer.setVolume(daySound.callVN);
//     assistPlayer.setVolume(daySound.assVN);
//     accessoryPlayer.setVolume(daySound.accVN);
//   }
// }