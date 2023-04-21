// contém a configuração de cores usada dentro do proejto;

import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff03A9F4);
  Color get secondary => const Color(0xffFFA500);

  //demais cores
  Color get whiteApp => Colors.white;
  Color get lightBlue => const Color(0xff03A9F4);
  Color get mediumBlue => const Color(0xff01579B);
  Color get darkBlue => const Color(0xff084994);
  Color get lightGrey => const Color(0xffA9A9A9);
  Color get darkGrey => const Color(0xff1C1C1C);
  Color get lightOrange => const Color(0xffFFA500);
  Color get darkOrange => const Color(0xffFF8C00);
  Color get redWarning =>  Colors.redAccent;

}

// adiciona uma extensão no BuildContext para que a cor seja acessada facilmente: "context.colors.primary";
extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}