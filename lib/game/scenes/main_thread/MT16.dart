import 'dart:ui';
import 'package:wyatts_story/game/gameplay.dart';
import 'package:wyatts_story/game/scene/scene.dart';
import 'package:wyatts_story/services/local_save_manager.dart';

class MT16 extends Scene {
  // MT16 ==> Main Thread (Scene) 16
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
  static String ambient;

  MT16(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  // Additional properties
  // ForcedDLGindexes reducesdlgFiles, because some of dlgFiles dialogues
  // are optional and dependent. basing on user previous decisions
  // Dlgfiles will be transfered to forceddlgfiles and dialogue
  // manager will play forced list instead of standard. Index controls which dialogue is played
  List<int> forcedDlgIndexes = <int>[];
  int index = 0;

  @override
  void onStart() {
    this._onStart();
  }

  void _onStart() async {
    await LocalSaveManager().clearSavedChoicesForScene(this.runtimeType);
    final choices = await LocalSaveManager().loadOptionalChoices();

    // Detect choices made for scene MT14(only them are important)
    var choosen = List<int>();
    choices.data.forEach((element) {
      if (element.scene == 'MT14') {
        choosen.add(element.index);
      }
    });

    choosen.sort();

    // Decide which dialogue to reduce into forcedDLG
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

    // Prepare forcedDLGIndexes
    var list = this.forcedDlgIndexes;
    list.add(first);
    list.add(7);
    list.add(second);
    list.add(third);

    // Ready to play by managers
  }

  @override
  void onTap() {
    if (this.dialogueManager.currentDialogueIndex > 1) {
      // Forced DLG contains prepared index to be passed to manager to be played
      // Indexes are limited and chosen from dlgFiles
      // This supplies them to dialogue manager
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
    // Game ends - show User walkthrough statistics
    this.gameplay.showStatisticsScreen();
  }
}
