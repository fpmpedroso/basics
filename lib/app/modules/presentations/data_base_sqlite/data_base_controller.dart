import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseController extends ChangeNotifier {
  //método para acesso ao Banco de Dados
  //Future<Database> openConnection() async{
  Future<void> openConnection() async {
    //obtém-se o caminho do Banco de Dados para fazer a conexão
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    //abre o Banco de Dados passando o caminho e a versão que se trabalha
    await openDatabase(
      databaseFinalPath,
      version: 3,

      //quando o BD ainda não existe (1ª vez que se iniciou o App)
      onCreate: (Database db, int version) {
        //utiliza-se o método batch para acumular ações e depois executá-la (commit)
        final batch = db.batch();
        batch.execute('''
          CREATE TABLE teste(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome VARCHAR(200)
          )
        ''');
        batch.commit();
      },

      //quando já existe o BD. Tem-se a possibilidade de informar uma nova versão para Upgrade
      onUpgrade: (Database db, oldVersion, newVersion) {
        print('#### executou o onUpgrade');

        //código que funcionará quando a versão for a 2
        if (oldVersion == 1) {
          //utiliza-se o método batch para acumular ações e depois executá-la (commit)
          final batch = db.batch();
          batch.execute('''
            CREATE TABLE produto(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nome VARCHAR(200)
            )
          ''');
          batch.commit();
        }

        //código que funcionará quando a versão for a 3
        if (oldVersion == 2) {
          //utiliza-se o método batch para acumular ações e depois executá-la (commit)
          final batch = db.batch();
          batch.execute('''
            CREATE TABLE produto(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nome VARCHAR(200)
            )
          ''');
          batch.commit();
        }

      },

      //já existe o BD. Tem-se a possibilidade de dizer que é necessário o Downgrade
      onDowngrade: (Database db, oldVersion, newVersion) {},
    );
  }
}
