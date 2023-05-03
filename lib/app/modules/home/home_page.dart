import 'package:basics/app/core/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var log = context.read<AppLogger>();
    //log.error('teste erro', 'nomeErro', StackTrace.current);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/newProject');
                },
                label: 'Criar projeto'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/runServer');
                },
                label: 'Rodar servidor'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/topMenu');
                },
                label: 'Top menu'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/containers');
                },
                label: 'Containers'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/newImage');
                },
                label: 'Imagens'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/howNavigate');
                },
                label: 'Navegação'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/rotations');
                },
                label: 'Rotação'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/buttonsType');
                },
                label: 'Tipos de botões'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/exampleListView');
                },
                label: 'List View'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/complexScreen');
                },
                label: 'Complex Screen'
              ),
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/dialogs');
                },
                label: 'Dialogs'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
