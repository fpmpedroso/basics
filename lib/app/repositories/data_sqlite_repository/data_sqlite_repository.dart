import 'package:basics/app/models/data_sqlite_model.dart';

abstract class DataSqliteRepository {
  //método para salvar dados
  Future<void> save(DateTime date, String description);

  //método para buscar todos os dados
  Future<List<DataSqliteModel>> findAll();
}
