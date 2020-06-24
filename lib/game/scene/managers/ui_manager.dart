import 'dart:async';

class UIManager {

  // Sends dialogue and path to author's image to UI widget
  StreamController<List<String>> controller = StreamController<List<String>>.broadcast();

  void showSimpleDialogue(String dlg) {
    final toSend = List<String>()
      ..add(dlg)
      ..add(_assignAvatar(dlg)); 
      
    controller.add(toSend);
  }

  void showDialogueWithAnswers(List<String> dlgs) {
    final toSend = dlgs;
    dlgs.insert(1, _assignAvatar(dlgs[0]));
    controller.add(toSend);
  }

  String _assignAvatar(String dlg) {
    if (dlg.contains('Anton: '))              return 'assets/images/characters/avatars/Anton.png';
    else if (dlg.contains('Brandon: '))       return 'assets/images/characters/avatars/Brandon.png';
    else if (dlg.contains('Daniel: '))        return 'assets/images/characters/avatars/Daniel.png';
    else if (dlg.contains('Interrogator1: ')) return 'assets/images/characters/avatars/Interrogator1.png';
    else if (dlg.contains('Interrogator2: ')) return 'assets/images/characters/avatars/Interrogator2.png';
    else if (dlg.contains('Interrogator3: ')) return 'assets/images/characters/avatars/Interrogator3.png';
    else if (dlg.contains('Interrogator4: ')) return 'assets/images/characters/avatars/Interrogator4.png';
    else if (dlg.contains('Interrogator5: ')) return 'assets/images/characters/avatars/Interrogator5.png';
    else if (dlg.contains('Jeff: '))          return 'assets/images/characters/avatars/Jeff.png';
    else if (dlg.contains('Jenny: '))         return 'assets/images/characters/avatars/Jenny.png';
    else if (dlg.contains('Judge: '))         return 'assets/images/characters/avatars/Judge.png';
    else if (dlg.contains('Kate: '))          return 'assets/images/characters/avatars/Kate.png';
    else if (dlg.contains('Luca: '))          return 'assets/images/characters/avatars/Luca.png';
    else if (dlg.contains('Martin: '))        return 'assets/images/characters/avatars/Martin.png';
    else if (dlg.contains('Mike: '))          return 'assets/images/characters/avatars/Mike.png';
    else if (dlg.contains('Roger: '))         return 'assets/images/characters/avatars/Roger.png';
    else if (dlg.contains('Seller: '))      return 'assets/images/characters/avatars/Seller.png';
    else if (dlg.contains('Susy: '))          return 'assets/images/characters/avatars/Susy.png';
    else if (dlg.contains('Technician: '))    return 'assets/images/characters/avatars/Technician.png';
    else if (dlg.contains('Waiter: '))        return 'assets/images/characters/avatars/Waiter.png';
    else if (dlg.contains('Wyatt: '))         return 'assets/images/characters/avatars/Wyatt.png';
    else                                      return 'error';
  }
  
}