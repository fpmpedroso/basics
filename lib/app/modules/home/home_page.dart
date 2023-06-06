import 'package:basics/app/core/ui/styles/colors_app.dart';
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
        child: SingleChildScrollView(
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
                    Navigator.of(context).pushNamed('/launchScreen');
                  },
                  label: 'SplashScreen'
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
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/showMsg');
                  },
                  label: 'showMsg'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/newForm');
                  },
                  label: 'Formulários'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/complexForm');
                  },
                  label: 'Complex form'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/readFromJson');
                  },
                  label: 'Lendo Json'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/stacks');
                  },
                  label: 'Widget Stack'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/bottomNavigator');
                  },
                  label: 'BottomNavigatorBar'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/pageViewEx');
                  },
                  label: 'PageView'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/elaboratedAvatar');
                  },
                  label: 'Avatar'
                ),
                Divider(
                  thickness: 1,
                  height: 50,
                  color: context.colors.lightGrey,
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/gerenciaSetState');
                  },
                  label: 'SetState'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/gerenciaValueNotifier');
                  },
                  label: 'ValueNotifier'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/gerenciaChangeNotifier');
                  },
                  label: 'ChangeNotifier'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/gerenciaProvider');
                  },
                  label: 'Provider'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/visibility');
                  },
                  label: 'Visibility'
                ),
                Divider(
                  thickness: 1,
                  height: 50,
                  color: context.colors.lightGrey,
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/listenerLoader');
                  },
                  label: 'Loader'
                ),
                ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/dataSqlitePage');
                  },
                  label: 'BD interno'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
