//responsável pelo tema padrão do projeto

import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
import '../styles/buttons_app.dart';

class ThemeApp {
  ThemeApp._();

  //padronização das bordas
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: ColorsApp.instance.darkBlue),
  );

  static final theme = ThemeData(
    //scaffold
    scaffoldBackgroundColor: ColorsApp.instance.whiteApp,
    
    //appBar
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.instance.mediumBlue,
      elevation: 0,
      titleTextStyle: TextsApp.instance.textBold.copyWith(
        fontSize: 20,
        color: ColorsApp.instance.whiteApp
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsApp.instance.whiteApp,
      ),
    ),
    
    //colors
    primaryColor: ColorsApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    
    //buttons
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ButtonsApp.instance.primaryButton),

    //inputs
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextsApp.instance.textRegular.copyWith(color: ColorsApp.instance.darkGrey),
      errorStyle: TextsApp.instance.textRegular.copyWith(color: ColorsApp.instance.redWarning),
    ),

  );
}