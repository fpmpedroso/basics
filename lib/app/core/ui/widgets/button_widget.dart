// contém modelos de botões padrões
// com ou sem fundo

import 'package:basics/app/core/ui/styles/buttons_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final bool outline;
  
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height,
    this.outline = false
  });

  ButtonWidget.primary({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height,
  }) :
      style = ButtonsApp.instance.primaryButton,
      labelStyle = TextsApp.instance.textBold,
      outline = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );

    return SizedBox(
      width: width,
      height: height,
      child: outline
        ? OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: labelText,
        )
        : ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: labelText,
        ),
    );
  }
}
