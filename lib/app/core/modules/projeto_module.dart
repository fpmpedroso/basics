// Classe que é responsável por gerir as dependências e rotas, trabalha em conjunto com
// os módulos e com ProjetoPage()

import 'package:basics/app/core/modules/projeto_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class ProjetoModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  ProjetoModule(
      {required Map<String, WidgetBuilder> routers,
      List<SingleChildWidget>? bindings})
      : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers
        .map((key, pageBuilder) => MapEntry(key, (_) => ProjetoPage(
          page: pageBuilder,
          bindings: _bindings,
        )));
  }
}