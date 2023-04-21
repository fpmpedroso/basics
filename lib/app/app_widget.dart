// classe responsável por carregar o MaterialApp
// possui todas as rotas do projeto
// cada rota foi configurada para que faça seu próprio carregamento de dependências

import 'package:basics/app/modules/home/home_module.dart';
import 'package:basics/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'core/ui/theme/theme_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basics',
      theme: ThemeApp.theme,
      debugShowCheckedModeBanner: false,
      routes: {
        ...HomeModule().routers,
      },
      //home: const SplashPage(),
      home: const SplashPage()
    );
  }
}