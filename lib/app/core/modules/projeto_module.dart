// Classe que é responsável por gerir as dependências e rotas, trabalha em conjunto com
// os módulos e com ProjetoPage()

//o método getPage serve para fazer navegações com efeitos, onde é delegado para o método fazer obter
//os dados necessários para criação da página

import 'package:basics/app/core/modules/projeto_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class ProjetoModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  ProjetoModule({
    required Map<String, WidgetBuilder> routers,
    List<SingleChildWidget>? bindings
  }) : _routers = routers,
      _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map((key, pageBuilder) => MapEntry(
        key,
        (_) => ProjetoPage(
              page: pageBuilder,
              bindings: _bindings,
            )));
  }

  //responsável por obter dados para navegação .push
  Widget getPage(String path, BuildContext context) {
    //encontra a rota nomeada desejada dentro do module
    final widgetBuilder = _routers[path];

    if (widgetBuilder != null) {
      //existindo a rota solicitada, retorna-se uma página com suas dependências
      return ProjetoPage(
        page: widgetBuilder, 
        bindings: _bindings
      );
    }
    //caso não encontre a rota ou não consiga montar a página
    throw Exception();
  }
}
