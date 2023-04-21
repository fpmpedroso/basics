// contém a configuração do padrão de texto do projeto

import 'package:flutter/material.dart';

class TextsApp {
  static TextsApp? _instance;

  TextsApp._();
  static TextsApp get instance {
    _instance ??= TextsApp._();
    return _instance!;
  }

  //fonte primária
  String get font => 'Lora';

  //padrão textRegular
  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: font,
      );

  //padrão textBold
  TextStyle get textBold => TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: font,
      );

  //padrão do texto do botão
  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
}

// adiciona uma extensão no BuildContext para que a cor seja acessada facilmente;
extension TextsAppExtension on BuildContext {
  TextsApp get textsApp => TextsApp.instance;
}
