// classe responsável por carregar o MaterialApp
// possui todas as rotas do projeto
// cada rota foi configurada para que faça seu próprio carregamento de dependências

// StatefulWidget foi utilizado para controle da observação do App, devido o uso da classe SqliteAdmConnection
// initState para observar e dispose para descarregar os observáveis quando não são mais usados

import 'package:basics/app/core/database/sqlite_adm_connection.dart';
import 'package:basics/app/modules/home/home_module.dart';
import 'package:basics/app/modules/presentations/data_sqlite/data_sqlite_module.dart';
import 'package:basics/app/modules/presentations/gerencia_provider/gerencia_provider_module.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_module.dart';
import 'package:basics/app/modules/presentations/presentations_module.dart';
import 'package:basics/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/ui/theme/theme_app.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  //instância de SqliteAdmConnection para controle de abertura e fechamento do BD
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();

    //ao finalizar o Build executa-se a observação do administrador do Banco de Dados
    //SqliteAdmConnection serve para controlar os momentos de abertura e fechamento do Banco
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    super.dispose();

    //elimina o observável (controle da conexão com o BD) que não é mais utilizado
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Basics',
        theme: ThemeApp.theme,
        
        //INÍCIO: suporte para região e língua do app (em conjunto com a declaração no yaml)
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        //FIM: suporte para região e língua do app
        
        debugShowCheckedModeBanner: false,
        routes: {
          ...HomeModule().routers,
          ...PresentationsModule().routers,
          ...HowNavigateModule().routers,
          ...GerenciaProviderModule().routers,
          ...DataSqliteModule().routers,
        },
        //home: const SplashPage(),
        home: const SplashPage());
  }
}
