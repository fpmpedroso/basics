import './data_sqlite_repository.dart';

class DataSqliteRepositoryImpl implements DataSqliteRepository {
  @override
  void save(String texto) {
    if (texto == 'ok') {
      texto = 'era ok';
    }

    print(texto);
  }
}
