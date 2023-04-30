import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_param.dart';

class HowNavigateModule extends ProjetoModule {
  HowNavigateModule()
      : super(routers: {
          '/param': (context) => const HowNavigateParam(),
        });
}
