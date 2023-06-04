import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/presentations/data_sqlite/data_sqlite_controller.dart';
import 'package:basics/app/modules/presentations/data_sqlite/data_sqlite_page.dart';
import 'package:basics/app/repositories/data_sqlite_repository/data_sqlite_repository.dart';
import 'package:basics/app/repositories/data_sqlite_repository/data_sqlite_repository_impl.dart';
import 'package:basics/app/services/data_sqlite_service/data_sqlite_service.dart';
import 'package:basics/app/services/data_sqlite_service/data_sqlite_service_impl.dart';
import 'package:provider/provider.dart';

class DataSqliteModule extends ProjetoModule {
  DataSqliteModule()
    : super(
      bindings: [
        Provider<DataSqliteRepository>(
          create: (context) => DataSqliteRepositoryImpl(sqliteConnectionFactory: context.read(), log: context.read()),
        ),
        Provider<DataSqliteService>(
          create: (context) => DataSqliteServiceImpl(dataSqliteRepository: context.read())
        ),
        ChangeNotifierProvider(
          create: (context) => DataSqliteController(dataSqliteService: context.read(), log: context.read()),
        )
      ], 
      routers: {
        '/dataSqlitePage': (context) => DataSqlitePage(controller: context.read(),)
      }
    );
}
