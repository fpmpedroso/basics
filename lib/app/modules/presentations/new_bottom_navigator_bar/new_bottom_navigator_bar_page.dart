import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/modules/presentations/new_bottom_navigator_bar/widgets/page2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/page1.dart';

class NewBottomNavigatorBarPage extends StatefulWidget {
  const NewBottomNavigatorBarPage({Key? key}) : super(key: key);

  @override
  State<NewBottomNavigatorBarPage> createState() =>
      _NewBottomNavigatorBarPageState();
}

class _NewBottomNavigatorBarPageState extends State<NewBottomNavigatorBarPage> {
  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    final AppLogger log = context.read<AppLogger>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigatorBar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: initialIndex, //controla qual index atual
          onTap: (index) {
            //faz a função conforme o index do botão de navegação
            log.info('O index clicado foi: $index');

            //providencia a alteração conforme o usuário clica
            setState(() {
              initialIndex = index;
            });
          },
          iconSize: 30,
          backgroundColor: context.colors.lightOrange,
          selectedItemColor: context.colors.whiteApp,
          unselectedItemColor: context.colors.darkBlue,
          items: const [
            BottomNavigationBarItem(
                label: 'Página 1', icon: Icon(Icons.airplane_ticket)),
            BottomNavigationBarItem(
                label: 'Página 2', icon: Icon(Icons.battery_full_outlined)),
          ]),
      body: IndexedStack(
        index: initialIndex, //o index padrão já é zero
        children: const [
          Page1(),
          Page2(),
        ],
      ),
    );
  }
}
