import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/services/local_save_manager.dart';

// MT01 ==> Main Thread (Scene) 02
class MT16 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/24',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/16/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/16/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/16/02_a.mp3',
    'audio/dialogues/main_thread/16/02_b.mp3',
    'audio/dialogues/main_thread/16/02_c.mp3',
    'audio/dialogues/main_thread/16/02_d.mp3',
    'audio/dialogues/main_thread/16/02_e.mp3',
    'audio/dialogues/main_thread/16/03.mp3',
    'audio/dialogues/main_thread/16/04_a.mp3',
    'audio/dialogues/main_thread/16/04_b.mp3',
    'audio/dialogues/main_thread/16/04_c.mp3',
    'audio/dialogues/main_thread/16/05_a.mp3',
    'audio/dialogues/main_thread/16/05_b.mp3',
    'audio/dialogues/main_thread/16/05_c.mp3',
  ];

  static List<int> chgBackground = <int>[];

  MT16(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);

  List<int> forcedDlgIndexes = <int>[];
  int index = 0;

  @override
  void onStart() {
    this._onStart();
  }

  void _onStart() async {
    await LocalSaveManager()
        .clearSavedChoicesForScene(this.runtimeType.toString());

    final choices = await LocalSaveManager().loadOptionalChoices();

    var choosen = List<int>();
    choices.data.forEach((element) {
      if (element.scene == 'MT14') {
        choosen.add(element.index);
      }
    });

    choosen.sort();

    int first = choosen[0] - 3;
    int second = choosen[1] - 10;
    int third;

    if (first == 3 && second == 8)
      third = 11;
    else if (first == 4 && second == 8)
      third = 11;
    else if (first == 2 && second == 8)
      third = 12;
    else if (first == 3 && second == 9)
      third = 12;
    else if (first == 3 && second == 10)
      third = 12;
    else if (first == 4 && second == 9)
      third = 12;
    else if (first == 4 && second == 10)
      third = 12;
    else if (first == 5 && second == 8)
      third = 12;
    else if (first == 6 && second == 8)
      third = 12;
    else if (first == 2 && second == 9)
      third = 13;
    else if (first == 2 && second == 10)
      third = 13;
    else if (first == 5 && second == 9)
      third = 13;
    else if (first == 5 && second == 10)
      third = 13;
    else if (first == 6 && second == 9)
      third = 13;
    else if (first == 6 && second == 10) third = 13;

    var list = this.forcedDlgIndexes;
    list.add(first);
    list.add(7);
    list.add(second);
    list.add(third);
  }

  @override
  void onTap() {
    if (this.dialogueManager.currentDialogueIndex > 1) {
      this.dialogueManager.currentDialogueIndex = this.forcedDlgIndexes[index];
      if (this.forcedDlgIndexes.length - 1 > index)
        index++;
      else
        this.isFinished = true;
    }
    this.dialogueManager.playDialogue();
  }

  @override
  void nextScene() {
    // Show stats
    this.gameplay.showStatisticsScreen();
  }
}
