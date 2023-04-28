// Classe que possui espaço para prover dependências gerais do projeto
// faz o direcinamento para o carregamento de MaterialApp através de AppWidget()

import 'package:basics/app/app_widget.dart';
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
        Provider<AppLogger>(
          create: (_) => AppLoggerImpl()
        ),
      ],
      child: const AppWidget(),
    );
    
  }
}