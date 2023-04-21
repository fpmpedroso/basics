// classe que em conjunto com os módulos, fica responsável por gerir as dependências e rotas

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProjetoPage extends StatelessWidget {
  final WidgetBuilder _page;
  final List<SingleChildWidget>? _bindings;

  const ProjetoPage({
    Key? key,
    required WidgetBuilder page,
    List<SingleChildWidget>? bindings,
  })  : _bindings = bindings,
        _page = page,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //se a dependência for nula, popula a lista com uma fake
      providers: _bindings ?? [Provider(create: (_) => Object())],
      child: Builder(
        builder: (context) => _page(context)
      ),
    );
  }
}