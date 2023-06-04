//classe que serve para controlar o listener das msg de sucesso/erro e demonstração do loading
//utiliza o loader que não tem MIXIN
//toda essa estrutura é chamada no initState da Page que utiliza esse sistema

import 'package:basics/app/core/notifier/default_change_notifier.dart';
import 'package:basics/app/core/ui/helpers/messages_no_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class DefaultListenerNotifier {
  //recebe-se uma instância de DefaultChangeNotier
  final DefaultChangeNotifier changeNotifier;

  //recebe-se uma instância de MessagesNoMixin
  final MessagesNoMixin messagesNoMixin;

  //recebe-se através de um construtor
  DefaultListenerNotifier({
    required this.changeNotifier,
    required this.messagesNoMixin,
  });

  //método invocado para ficar escutando o changeNotifier
  //recebe como parâmetro um context que será passado para o loading e para as mensagens
  //como parâmetro, recebe-se o typedef SuccessVoidCallBack
  //como parâmetro opcional, recebe o typedef ErrorVoidCallBack
  void listener(
      {required BuildContext context,
      required SuccessVoidCallBack successCallBack,
      EveryVoidCallBack? everyCallBack,
      ErrorVoidCallBack? errorCallBack}) {
    //"pendura" um listener na instância
    changeNotifier.addListener(() {
      //caso exista alguma mensagem, aciona-se o método everyCallBack
      if (everyCallBack != null) {
        everyCallBack(changeNotifier, this);
      }

      //caso o changeNotifier pede para mostrar um loading
      if (changeNotifier.loading) {
        //loader do pacote flutter_overlay_loader
        Loader.show(context);
      } else {
        Loader.hide();
      }

      //caso o changeNotifier pede para exibir um erro/sucesso
      if (changeNotifier.hasError) {
        //caso existe a passagem de um tipo de erro
        if (errorCallBack != null) {
          //invoca-se o método atribuindo o changeNotifier e a própria instância
          errorCallBack(changeNotifier, this);
        }

        messagesNoMixin.showError(
            changeNotifier.error ?? 'Oops.. ocorreu um erro :(',
            context: context);
      } else if (changeNotifier.isSuccess) {
        //invoca-se o método atribuindo o changeNotifier e a própria instância
        successCallBack(changeNotifier, this);
      }
    });
  }

  //método para descarregar o listener da memória quando não será mais usado
  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

//adiciona-se um typedef para o controle do caso de sucesso
typedef SuccessVoidCallBack = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);

//adiciona-se um typedef para passagem de mensagens
typedef EveryVoidCallBack = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);

//adiciona-se um typedef para o controle de erro
typedef ErrorVoidCallBack = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);
