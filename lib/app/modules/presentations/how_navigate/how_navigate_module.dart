import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_param.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_transition.dart';

class HowNavigateModule extends ProjetoModule {
  HowNavigateModule()
      : super(
          routers: {
            '/param': (context) => const HowNavigateParam(),
            '/transition': (context) => const HowNavigateTransition(),
          },
          
          //esse binding foi para PresentationsModule, pois trata-se de um provedor "acima" deste
          //bindings: [
          //  ChangeNotifierProvider(create: (context) => HowNavigateController()),
          //]
        );
}
