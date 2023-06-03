

import 'package:basics/app/repositories/data_sqlite_repository/data_sqlite_repository.dart';

import './data_sqlite_service.dart';

class DataSqliteServiceImpl implements DataSqliteService {
  //armazena-se uma instância de DataBaseSqliteRepository
  final DataSqliteRepository _dataSqliteRepository;

  //recebe-se no construtor
  DataSqliteServiceImpl(
      {required DataSqliteRepository dataSqliteRepository})
      : _dataSqliteRepository = dataSqliteRepository;

  //somente um proxy que chama o método save do repository
  @override
  Future<void> save(DateTime date, String description) =>
      _dataSqliteRepository.save(date, description);

}