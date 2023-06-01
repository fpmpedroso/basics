import 'package:basics/app/repositories/sqlite_repository/data_base_sqlite_repository.dart';

import 'database_sqlite_service.dart';

class DatabaseSqliteServiceImpl implements DatabaseSqliteService {
  //armazena-se uma instância de DataBaseSqliteRepository
  final DataBaseSqliteRepository _baseSqliteRepository;

  //recebe-se no construtor
  DatabaseSqliteServiceImpl(
      {required DataBaseSqliteRepository dataBaseSqliteRepository})
      : _baseSqliteRepository = dataBaseSqliteRepository;

  //somente um proxy que chama o método save do repository
  @override
  Future<void> save(DateTime date, String description) =>
      _baseSqliteRepository.save(date, description);
}
