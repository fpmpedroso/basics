
abstract class DataBaseSqliteRepository {
  
  //regra de negócio do repositório
  Future<void> save(DateTime date, String description);

}