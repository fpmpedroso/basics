//Sistema de Mensagens sem usar o Mixin para poder ser utilizado pelas controllers

import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MessagesNoMixin {
  void showError(String message, {required BuildContext context}) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
          backgroundColor: context.colors.redWarning,
        ));
  }

  void showInfo(String message , {required BuildContext context}) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: message,
        ));
  }

  void showSuccess(String message , {required BuildContext context}) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
        ));
  }
}
