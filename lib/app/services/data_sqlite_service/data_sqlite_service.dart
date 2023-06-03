
abstract class DataSqliteService {
  
  //funcionará somente como um proxy, sem regras de negócios
  Future<void> save(DateTime date, String description);
  
}
