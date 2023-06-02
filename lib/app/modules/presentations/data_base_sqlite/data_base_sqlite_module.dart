
import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/presentations/data_base_sqlite/data_base_sqlite_controller.dart';
import 'package:basics/app/modules/presentations/data_base_sqlite/data_base_sqlite_page.dart';
import 'package:basics/app/repositories/sqlite_repository/data_base_sqlite_repository.dart';
import 'package:basics/app/repositories/sqlite_repository/data_base_sqlite_repository_impl.dart';
import 'package:basics/app/services/sqlite_service/database_sqlite_service.dart';
import 'package:basics/app/services/sqlite_service/database_sqlite_service_impl.dart';
import 'package:provider/provider.dart';

class DataBaseSqliteModule extends ProjetoModule{
  DataBaseSqliteModule() : super(
    bindings: [
      //repository: recebe uma classe de conexão e uma classe do AppLogger, que já estão sendo providas pela AppModule
      Provider<DataBaseSqliteRepository>(
        create: (context) => DataBaseSqliteRepositoryImpl(
          sqliteConnectionFactory: context.read(),
          log: context.read()
        )
      ),
      //service: recebe a classe Repository
      Provider<DatabaseSqliteService>(
        create: (context) => DatabaseSqliteServiceImpl(dataBaseSqliteRepository: context.read()),
      ),
      //controller: do tipo ChangeNotifierProvider devido cuidar das mudanças de estado
      ChangeNotifierProvider(
        create: (context) => DataBaseSqliteController(databaseSqliteService: context.read()),
      ),
    ],
    routers: {
      '/dataBaseSqlite' : (context) => DataBaseSqlitePage(controller: context.read(),),
    },
  );
  
}