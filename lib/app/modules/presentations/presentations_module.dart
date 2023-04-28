import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/presentations/new_project/new_project_page.dart';

class PresentationsModule extends ProjetoModule {
  PresentationsModule() : super(
    routers: {
      '/newProject':(context) => const NewProjectPage(),
    }
  );
}