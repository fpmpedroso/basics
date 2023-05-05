import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/presentations/buttons_type/buttons_type_page.dart';
import 'package:basics/app/modules/presentations/complex_screen/complex_screen_page.dart';
import 'package:basics/app/modules/presentations/containers/containers_page.dart';
import 'package:basics/app/modules/presentations/dialogs/dialogs_page.dart';
import 'package:basics/app/modules/presentations/example_list_view/example_list_view_page.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_page.dart';
import 'package:basics/app/modules/presentations/new_form/new_form_page.dart';
import 'package:basics/app/modules/presentations/new_image/new_image_page.dart';
import 'package:basics/app/modules/presentations/new_project/new_project_page.dart';
import 'package:basics/app/modules/presentations/rotations/rotations_page.dart';
import 'package:basics/app/modules/presentations/run_server/run_server_page.dart';
import 'package:basics/app/modules/presentations/show_messages/show_messages_page.dart';
import 'package:basics/app/modules/presentations/top_menu/top_menu_page.dart';

class PresentationsModule extends ProjetoModule {
  PresentationsModule() : super(
    routers: {
      '/newProject' : (context) => const NewProjectPage(),
      '/runServer' : (context) => const RunServerPage(),
      '/topMenu' : (context) => const TopMenuPage(),
      '/containers' : (context) => const ContainersPage(),
      '/newImage' : (context) => const NewImagePage(),
      '/howNavigate' : (context) => const HowNavigatePage(),
      '/rotations' : (context) => const RotationsPage(),
      '/buttonsType' : (context) => const ButtonsTypePage(),
      '/exampleListView' : (context) => const ExampleListViewPage(),
      '/complexScreen' : (context) => const ComplexScreenPage(),
      '/dialogs' : (context) => const DialogsPage(),
      '/showMsg' : (context) => const ShowMessagesPage(),
      '/newForm' : (context) => const NewFormPage(),
    }
  );
}