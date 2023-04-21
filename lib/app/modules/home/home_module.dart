// contém as rotas de Home e suas dependências

import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/home/home_controller.dart';
import 'package:basics/app/modules/home/home_page.dart';
import 'package:provider/provider.dart';

class HomeModule extends ProjetoModule{
  HomeModule() : super(
    routers: {
      '/home':(context) => const HomePage()
    },
    bindings: [
      ChangeNotifierProvider(
        create: (_) => HomeController()
      )
    ]
  );
}