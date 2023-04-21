// Contém uma AppBar customizada que pode ser utilizada pelo projeto todo

import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends AppBar{
  AppBarWidget({
    super.key, double elevation = 0
  }) : super (
    elevation: elevation,
    title: Text(
      'Gerência de Estado',
      style: TextsApp.instance.textBold.copyWith(
        fontSize: 20,
        color: ColorsApp.instance.darkOrange
      ),
    ),
    backgroundColor: ColorsApp.instance.lightBlue
  );
}