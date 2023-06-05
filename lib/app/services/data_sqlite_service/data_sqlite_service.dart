import 'package:basics/app/models/data_sqlite_model.dart';

abstract class DataSqliteService {
  //funcionará somente como um proxy, sem regras de negócios
  Future<void> save(DateTime date, String description);

  //busca de todos os dados
  Future<List<DataSqliteModel>> findAll();
}
