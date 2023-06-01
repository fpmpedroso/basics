//contém o simbolo que indica carregamento da página
// por ser um mixin vai após o extends com a palavra reservada ("with Loader")

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';

mixin Loader<T extends StatefulWidget> on State<T>{

  var isOpen = false;

  void showLoader(){
    if (!isOpen){
      isOpen = true;
      showDialog(
        context: context,
        builder: (_){
          return LoadingAnimationWidget.threeArchedCircle(
            color: context.colors.whiteApp,
            size: 60,
          );
        },
      );
    }
  }

  void hideLoader(){
    if (isOpen){
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

}