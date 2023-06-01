import 'package:basics/app/core/database/sqlite_connection_factory.dart';
import 'package:basics/app/core/exceptions/failure.dart';
import 'package:basics/app/core/logger/app_logger.dart';

import './data_base_sqlite_repository.dart';

class DataBaseSqliteRepositoryImpl implements DataBaseSqliteRepository {
  //armazena-se uma instância da conexão do Banco de Dados
  final SqliteConnectionFactory _sqliteConnectionFactory;

  //armazena-se uma instância do Log de mensagens
  final AppLogger _log;

  //recebe-se no construtor
  DataBaseSqliteRepositoryImpl(
      {required SqliteConnectionFactory sqliteConnectionFactory, required log})
      : _sqliteConnectionFactory = sqliteConnectionFactory,
        _log = log;

  @override
  Future<void> save(DateTime date, String description) async {
    
    try {
      //abre-se uma conexão
      final conn = await _sqliteConnectionFactory.openConnection();

      //cia-se a query
      await conn.insert('tabela_01', {
        'id': null,
        'data_hora': date.toIso8601String(), //passa a data para String
        'desricao': description
      });

    } catch (e, s) {
      _log.error('erro na inserção dos dados', e, s);

      throw Failure(message: 'Oops.. não foi possível salvar os dados :(');
    }
  }
}
