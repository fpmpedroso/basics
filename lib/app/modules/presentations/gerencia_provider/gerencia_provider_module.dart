
import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/presentations/gerencia_provider/gerencia_provider_controller.dart';
import 'package:basics/app/modules/presentations/gerencia_provider/gerencia_provider_page.dart';
import 'package:provider/provider.dart';

class GerenciaProviderModule extends ProjetoModule{
  GerenciaProviderModule() : super(
    routers: {
      '/gerenciaProvider' : (context) => const GerenciaProviderPage(),
    },
    bindings: [
      ChangeNotifierProvider(
        create:(_) => GerenciaProviderController(),
      )
    ]
  );
  
}