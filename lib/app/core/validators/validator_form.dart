// contém um método de comparação de valores
// anda junto com o pack Validatorless

import 'package:flutter/material.dart';

class ValidatorForm {
  ValidatorForm._();

  static FormFieldValidator compare(
      TextEditingController? valueEc, String message) {
    return (value) {
      //valor que foi digitado pelo usuário

      //atribui o valor que vai comparar
      final valueCompare = valueEc?.text ?? '';

      //faz a comparação do digitado com aquele que se deseja
      if (value == null || (value != null && value != valueCompare)) {
        return message;
      } else {
        return null;
      }
    };
  }
}
