// como não é possível instanciar Mixin, não seria possível chamar o Loader e Messages na controller
// para resolver, utiliza-se uma variável bolleana que é alterada a cada chamada
// dessa forma, "ouve-se" a variável na Page e pode trocar o estado de algum widget

import 'package:flutter/material.dart';

class ListenerLoaderController extends ChangeNotifier {
  //variável de alteração do loader
  bool loaderIsOpen = false;

  void changeLoader() async {
    loaderIsOpen = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    loaderIsOpen = false;
    notifyListeners();
  }
}
