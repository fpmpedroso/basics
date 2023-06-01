
abstract class DatabaseSqliteService {
  
  //funcionará somente como um proxy, sem regras de negócios
  Future<void> save(DateTime date, String description);
}
