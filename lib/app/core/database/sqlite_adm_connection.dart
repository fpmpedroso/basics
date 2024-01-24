//classe que administra a abertura e fechamento do Banco de Dados
//importante prática para evitar que o arquivo se corrompa com interrupções não esperadas

//trata-se de um mixin com WidgetsBindingObserver, responsável por observar o comportamento do Flutter
//para que o Flutter seja observado e exista interação, é preciso transformar a classe AppWidget em
//StatefulWidget para controle do ciclo de vida do initState

import 'package:basics/app/core/database/sqlite_connection_factory.dart';
import 'package:flutter/material.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  //informa qual atitude que o usuário teve dentro da aplicação
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //obtém uma instância de conexão
    final connection = SqliteConnectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        connection.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
