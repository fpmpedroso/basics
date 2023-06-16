import 'package:basics/app/models/data_sqlite_model.dart';
import 'package:basics/app/repositories/data_sqlite_repository/data_sqlite_repository.dart';

import './data_sqlite_service.dart';

class DataSqliteServiceImpl implements DataSqliteService {
  //armazena-se uma instância de DataBaseSqliteRepository
  final DataSqliteRepository _dataSqliteRepository;

  //recebe-se no construtor
  DataSqliteServiceImpl({required DataSqliteRepository dataSqliteRepository})
      : _dataSqliteRepository = dataSqliteRepository;

  //Método para salvar. Somente um proxy que chama o método save do repository
  @override
  Future<void> save(DateTime date, String description) =>
      _dataSqliteRepository.save(date, description);

  //busca de todos os registros. Funcionará como proxy, sem lógica implementada
  @override
  Future<List<DataSqliteModel>> findAll() => _dataSqliteRepository.findAll();

  //exclusão por id
  @override
  Future<void> delete(int id) => _dataSqliteRepository.delete(id);
}
