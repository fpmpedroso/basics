import 'package:flutter/material.dart';

// contém uma extensão de MediaQuery para facilitar a manipulação dos tamanhos proporcionais no projeto
// feito o acesso da seguinte forma: "context.screenWidth" ou "context.screenHeight"

extension SizeExtensions on BuildContext {
  //obtém o tamanho da tela
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  //trabalhando em %
  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;
}