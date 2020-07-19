import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT11 extends Scene {
  // Asset Paths
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
  ];

  static List<int> chgBackground = <int>[4, 7, 10, 12, 14];

  MT11(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);

  @override
  void bottomButtonClicked({int id}) {
    onTap(buttonId: id);
  }

  @override
  void onTap({int buttonId}) {
    if (this.dialogueManager.currentDialogueIndex == 4) {
      if (buttonId == 1) this.dialogueManager.playDialogue();
    } else if (this.dialogueManager.currentDialogueIndex == 7) {
      if (buttonId == 2) this.dialogueManager.playDialogue();
    } else if (this.dialogueManager.currentDialogueIndex == 10) {
      if (buttonId == 3) this.dialogueManager.playDialogue();
    } else if (this.dialogueManager.currentDialogueIndex == 12) {
      if (buttonId == 4) this.dialogueManager.playDialogue();
    } else if (this.dialogueManager.currentDialogueIndex == 14) {
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
