// Classe que possui espaço para prover dependências gerais do projeto
// faz o direcinamento para o carregamento de MaterialApp através de AppWidget()

import 'package:basics/app/app_widget.dart';
import 'package:basics/app/core/database/sqlite_connection_factory.dart';
import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/logger/app_logger_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        //sempre que tiver uma classe abstrata, deve-se tipar o Provider e utilizar a implementação
        //Provide do Log
        Provider<AppLogger>(
          create: (_) => AppLoggerImpl()
        ),
        
        //Provide da conexão com o Banco de Dados
        Provider(
          create: (_) => SqliteConnectionFactory(),
          lazy: false,  //serve para dizer que assim que a aplicação iniciar, a Classe deve ser instanciada e deixar tudo pronto para uso
        ),
      ],
      child: const AppWidget(),
    );
    
  }
}