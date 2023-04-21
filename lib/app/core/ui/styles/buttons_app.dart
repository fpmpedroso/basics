// contém a configuração dos botões personalizados

import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ButtonsApp {
  static ButtonsApp? _instance;

  ButtonsApp._();
  static ButtonsApp get instance {
    _instance ??= ButtonsApp._();
    return _instance!;
  }

  //configuração do botão primário com fundo
  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    backgroundColor: ColorsApp.instance.primary,
    textStyle: TextsApp.instance.textButtonLabel.copyWith(fontSize: 14),
  );

  //configuração do botão primário sem fundo
  ButtonStyle get primaryOutLineButtom => OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ),
    side: BorderSide(
      color: ColorsApp.instance.primary,
    ),
    textStyle: TextsApp.instance.textBold.copyWith(fontSize: 14),
  );
}

// adiciona uma extensão no BuildContext para que a cor seja acessada facilmente;
extension ButtonsAppExtension on BuildContext {
  ButtonsApp get buttonsApp => ButtonsApp.instance;
}