//funciona como uma fábrica de migration (troca de versões)
//anda junto com a interface Megration()

import 'package:basics/app/core/database/migrations/migration.dart';
import 'package:basics/app/core/database/migrations/migration_v1.dart';
import 'package:basics/app/core/database/migrations/migration_v2.dart';
import 'package:basics/app/core/database/migrations/migration_v3.dart';

class SqliteMigrationFactory {
  //método que retorna um array de migrations existentes
  //entende-se que o usuário acabou de instalar e precisa ter acesso à todas as versões
  List<Migration> getCreateMigration() => [
    MigrationV1(),
    MigrationV2(),
    MigrationV3(),
  ];

  //método que impede repetição de códigos, verificando qual a versão que o App se encontra e
  //roda somente as atualizações necessárias
  List<Migration> getUpdateMigration(int version) {
    final migrations = <Migration>[];

    //se o usuário tem a versão 1, deve-se instalar a versão 2 e a versão 3
    if (version == 1) {
      //sobe todas as versões para não perder qualquer atuazliação existente
      //como por exemplo: o usuário baixa o App quando já está na versão 3. Não pode perder a versão 2...
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }

    //se a versão do usuário for a 2, só está faltando instalar a versão 3
    if (version == 2) {
      migrations.add(MigrationV3());
    }

    return migrations;
  }
}
