// classe responsável por carregar o MaterialApp
// possui todas as rotas do projeto
// cada rota foi configurada para que faça seu próprio carregamento de dependências

import 'package:basics/app/modules/home/home_module.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_module.dart';
import 'package:basics/app/modules/presentations/presentations_module.dart';
import 'package:basics/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/ui/theme/theme_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basics',
      theme: ThemeApp.theme,
      //INÍCIO: suporte para região e língua do app (em conjunto com a declaração no yaml)
        localizationsDelegates: const[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const[
          Locale('pt', 'BR'),
        ],
      //FIM: suporte para região e língua do app
      debugShowCheckedModeBanner: false,
      routes: {
        ...HomeModule().routers,
        ...PresentationsModule().routers,
        ...HowNavigateModule().routers,
      },
      //home: const SplashPage(),
      home: const SplashPage()
    );
  }
}