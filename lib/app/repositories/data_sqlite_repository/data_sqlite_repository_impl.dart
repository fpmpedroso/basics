import 'package:basics/app/core/database/sqlite_connection_factory.dart';
import 'package:basics/app/core/exceptions/failure.dart';
import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/models/data_sqlite_model.dart';

import './data_sqlite_repository.dart';

class DataSqliteRepositoryImpl implements DataSqliteRepository {
  //armazena-se uma instância da conexão do Banco de Dados
  final SqliteConnectionFactory _sqliteConnectionFactory;

  final AppLogger _log;

  //recebe-se no construtor
  DataSqliteRepositoryImpl(
      {required SqliteConnectionFactory sqliteConnectionFactory,
      required AppLogger log})
      : _sqliteConnectionFactory = sqliteConnectionFactory,
        _log = log;

  //método para salvar os dados
  @override
  Future<void> save(DateTime date, String description) async {
    try {
      //abre-se uma conexão
      final conn = await _sqliteConnectionFactory.openConnection();

      //cia-se a query
      await conn.insert('tabela_01', {
        'id': null,
        'data_hora': date.toIso8601String(), //passa a data para String
        'descricao': description
      });
    } catch (e, s) {
      _log.error('erro na inserção dos dados', e, s);

      throw Failure(message: 'Oops.. não foi possível salvar os dados :(');
    }
  }

  //método para buscar todos os dados
  @override
  Future<List<DataSqliteModel>> findAll() async {
    try {
      //abre-se uma conexão
      final conn = await _sqliteConnectionFactory.openConnection();

      var query = '''
        SELECT * 
        FROM tabela_01
        ORDER BY data_hora
      ''';

      //armazena-se o resultado
      final result = await conn.rawQuery(query);

      //converte-se o resultado para uma lista através do chamamento do construtor utilitário de conversão
      return result.map((e) => DataSqliteModel.loadFromDB(e)).toList();
    } catch (e, s) {
      _log.error('erro no findAll', e, s);

      throw Failure(message: 'Oops.. não foi possível buscar os dados :(');
    }
  }
}
