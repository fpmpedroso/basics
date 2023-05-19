import 'package:flutter/material.dart';

class GerenciaProviderController extends ChangeNotifier {
  String urlImage = 'assets/images/img_demo.jpeg';

  String urlImageSelector = 'assets/images/img_demo.jpeg';

  void changeImage() {
    if (urlImage == 'assets/images/img_demo.jpeg') {
      urlImage = 'assets/images/img_logo.png';
    } else if (urlImage == 'assets/images/img_logo.png') {
      urlImage = 'assets/images/img_demo.jpeg';
    }

    //notifica os ouvintes sobre a mudança de valor
    notifyListeners();
  }

  void changeImageSelector(){
    if (urlImageSelector == 'assets/images/img_demo.jpeg') {
      urlImageSelector = 'assets/images/img_logo.png';
    } else if (urlImageSelector == 'assets/images/img_logo.png') {
      urlImageSelector = 'assets/images/img_demo.jpeg';
    }

    //notifica os ouvintes sobre a mudança de valor
    notifyListeners();
  }
}
