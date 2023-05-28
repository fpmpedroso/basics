//trata-se da 1ª versão do Banco de dados;
//implementa-se a interface Migration();
//a classe é carregada em SqliteMigrationFactory;

import 'package:basics/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    //prepara a execução do comando sql
    batch.execute('''
      CREATE TABLE tabela_01(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data_hora DATETIME,
        descricao VARCHAR(100) NOT NULL
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
