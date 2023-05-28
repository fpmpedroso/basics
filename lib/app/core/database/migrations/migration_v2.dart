//simualação de uma nova versão de Banco de Dados disponível;


import 'package:basics/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV2 implements Migration{
  
  @override
  void create(Batch batch) {
    
    //mesmo sendo uma versão de upgrade, deve-se rodar o código no método create(), pois
    //pode ser o primeiro download do usuário e ele então o método invocado seria o onCreate e não
    //o onUpgrade, ficando então sem a versão
    
    //prepara a execução do comando sql
    batch.execute('''
      CREATE TABLE tabela_02(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao VARCHAR(100) NOT NULL
      )
    ''');
  }

  @override
  void update(Batch batch) {
    //cria-se a mesma tabela

    //prepara a execução do comando sql
    batch.execute('''
      CREATE TABLE tabela_02(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao VARCHAR(100) NOT NULL
      )
    ''');
  }
  
}