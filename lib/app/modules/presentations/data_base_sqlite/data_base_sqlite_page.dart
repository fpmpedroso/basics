import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
//import 'package:basics/app/modules/presentations/data_base_sqlite/data_base_controller.dart';
//import 'package:provider/provider.dart';

class DataBaseSqlitePage extends StatelessWidget {
  const DataBaseSqlitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var teste = context.read<DataBaseController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco de Dados Interno'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Criação de Database no dispositivo',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''1) Utiliza-se os seguintes pacotes:
                - sqflite para o Banco de Dados;
                - path para setar o caminho correto de salvamento do Banco de Dados no dispositivo; 
              ''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '2) Cria-se o arquivo de conexão dentro de app/core/database/sqlite_connection_factory.dart',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '3) Para resolver as questões de versões, utiliza-se sqlite_migration_factory.dart',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''4) Para controle de abertura e fechamento da conexão, utiliza-se sqlite_adm_connection.dart
                - impede que interrupções corrompa o aplicativo;
                - trata-se de um mixin com WidgetsBindingObserver que controla todos os estados do Flutter''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''5) A classe de conexão deve ser provida para todo o projeto através do Provider
                - é declarada na classe AppModule''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''6) A classe de conexão deve ser provida para todo o projeto através do Provider
                - é declarada na classe AppModule''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''7) A Classe AppWidget é transformada em StatefulWidget para iniciar (initState) o controle da conexão com o BD
                - após o uso, o observável sofre um "dispose"''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''8) Como o Android gera arquivos backup na nuvem, é preciso desabilitar essa função para evitar problemas
                - em android/app/src/main/AndroidManifest.xml, na tag Application 
                - adiiona-se: android:allowBackup="false" e também android:fullBackupOnly="false" ''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
