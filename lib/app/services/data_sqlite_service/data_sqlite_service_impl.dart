import 'package:basics/app/repositories/data_sqlite_repository/data_sqlite_repository.dart';

import './data_sqlite_service.dart';

class DataSqliteServiceImpl implements DataSqliteService {
  final DataSqliteRepository _dataSqliteRepository;

  DataSqliteServiceImpl({required DataSqliteRepository dataSqliteRepository})
      : _dataSqliteRepository = dataSqliteRepository;
  
  @override
  void save(String texto) => _dataSqliteRepository.save('ok');

}