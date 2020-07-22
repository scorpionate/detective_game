import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

class MT11 extends Scene {
  // MT01 ==> Main Thread (Scene) 01
  // bgdImages: contains background images paths SHOULDNT BE EMPTY
  //
  // dlgFiles: contains dialogues music files paths SHOULDNT BE EMPTY
  // List start from path to file with dialogues saved in txt. Basing on that file,
  // the UI is generated. Scene automatically plays dialogues starting from index 1
  // Transcript.txt should have the number of lines equals dlgFiles.length-1
  //
  // chgBackground: contains int's saying at which dialogue(it's index)
  // scene should change background to the following ones listed in bgdImages MAY BE EMPTY
  // ambient: contains path to ambient backgorund of scene If not null it will be played(in loop)
  // automatically when scene starts and automatically stopped when scene ends
  static List<String> bgdImages = <String>[
    'locations/main_thread/15',
    'locations/main_thread/16',
    'locations/main_thread/17',
    'locations/main_thread/18',
    'locations/main_thread/19',
    'locations/main_thread/20',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/11/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/11/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/11/02.mp3',
    'audio/dialogues/main_thread/11/03.mp3',
    'audio/dialogues/main_thread/11/04.mp3',
    'audio/dialogues/main_thread/11/05.mp3',
    'audio/dialogues/main_thread/11/06.mp3',
    'audio/dialogues/main_thread/11/07.mp3',
    'audio/dialogues/main_thread/11/08.mp3',
    'audio/dialogues/main_thread/11/09.mp3',
    'audio/dialogues/main_thread/11/10.mp3',
    'audio/dialogues/main_thread/11/11.mp3',
    'audio/dialogues/main_thread/11/12.mp3',
    'audio/dialogues/main_thread/11/13.mp3',
    'audio/dialogues/main_thread/11/14.mp3',
    'audio/dialogues/main_thread/11/15.mp3',
    'audio/dialogues/main_thread/11/16.mp3',
    'audio/dialogues/main_thread/11/17.mp3',
    'audio/dialogues/main_thread/11/18.mp3',
    'audio/dialogues/main_thread/11/19.mp3',
    'audio/dialogues/main_thread/11/20.mp3',
    'audio/dialogues/main_thread/11/21.mp3',
    'audio/dialogues/main_thread/11/22.mp3',
  ];

  static List<int> chgBackground = <int>[5, 8, 13, 16, 19];
  static String ambient;

  MT11(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  // This scene uses custom buttom buttons
  // Since scene doesnt know about UIManager it is required to prepare
  // funcs for following buttons
  @override
  void bottomButtonClicked({int id}) {
    onTap(buttonId: id);
  }

  @override
  void onTap({int buttonId}) {
    if (this.dialogueManager.currentDialogueIndex == MT11.chgBackground[0]) {
      if (buttonId == 1) this.dialogueManager.playDialogue();
    } else if (this.dialogueManager.currentDialogueIndex ==
        MT11.chgBackground[1]) {
      if (buttonId == 2) this.dialogueManager.playDialogue();
    } else if (this.dialogueManager.currentDialogueIndex ==
        MT11.chgBackground[2]) {
      if (buttonId == 3) this.dialogueManager.playDialogue();
    } else if (this.dialogueManager.currentDialogueIndex ==
        MT11.chgBackground[3]) {
      if (buttonId == 4) this.dialogueManager.playDialogue();
    } else if (this.dialogueManager.currentDialogueIndex ==
        MT11.chgBackground[4]) {
      if (buttonId == 5) this.dialogueManager.playDialogue();
    } else {
      if (buttonId != 1 &&
          buttonId != 2 &&
          buttonId != 3 &&
          buttonId != 4 &&
          buttonId != 5 &&
          buttonId != 6) {
        this..dialogueManager.playDialogue();
      }
    }
  }
}
