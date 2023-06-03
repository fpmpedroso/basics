abstract class DataSqliteRepository {
  
  //regra de negócio do repositório
  Future<void> save(DateTime date, String description);
  
}
