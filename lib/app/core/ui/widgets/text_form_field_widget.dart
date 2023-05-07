// contém um TextFormField customizado
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  //controles
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  //parâmetros para personalização
  final String label;
  final bool obscureText;

  //listener para saber se o cadeado da senha foi clicado
  final ValueNotifier<bool> _obscureTextVN;

  TextFormFieldWidget({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget._obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: obscureTextVNValue,
          style: TextStyle(
            fontSize: 14,
            color: context.colors.darkGrey,
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              fontSize: 14,
              color: context.colors.darkGrey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: context.colors.darkGrey
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: context.colors.darkGrey
              ),
            ),
            suffixIcon: widget.obscureText
              ? IconButton(
                onPressed: (){
                  //inverte-se o valor true/false
                  widget._obscureTextVN.value = !obscureTextVNValue;
                }, 
                icon: Icon(
                  obscureTextVNValue ? Icons.lock : Icons.lock_open,
                  color: context.colors.darkGrey,
                ),
              )
              : null
          ),
        );
      },
    );
  }
}
