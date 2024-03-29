import 'package:basics/app/core/modules/projeto_module.dart';
import 'package:basics/app/modules/presentations/adress_nominatim/adress_nominatim_page.dart';
import 'package:basics/app/modules/presentations/bottom_sheet/bottom_sheet_page.dart';
import 'package:basics/app/modules/presentations/buttons_type/buttons_type_page.dart';
import 'package:basics/app/modules/presentations/complex_form/complex_form_page.dart';
import 'package:basics/app/modules/presentations/complex_screen/complex_screen_page.dart';
import 'package:basics/app/modules/presentations/containers/containers_page.dart';
//import 'package:basics/app/modules/presentations/data_base_sqlite/data_base_controller.dart';
import 'package:basics/app/modules/presentations/dialogs/dialogs_page.dart';
import 'package:basics/app/modules/presentations/elaborated_avatar/elaborated_avatar_page.dart';
import 'package:basics/app/modules/presentations/example_list_view/example_list_view_page.dart';
import 'package:basics/app/modules/presentations/geolocator/geolocator_page.dart';
import 'package:basics/app/modules/presentations/gerencia_change_notifier/gerencia_change_notifier_page.dart';
import 'package:basics/app/modules/presentations/gerencia_set_state/gerencia_set_state_page.dart';
import 'package:basics/app/modules/presentations/gerencia_value_notifier/gerencia_value_notifier_page.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_controller.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_page.dart';
import 'package:basics/app/modules/presentations/launch_sreen/launch_screen_page.dart';
import 'package:basics/app/modules/presentations/listener_loader/listener_loader_controller.dart';
import 'package:basics/app/modules/presentations/listener_loader/listener_loader_page.dart';
import 'package:basics/app/modules/presentations/local_maps/local_maps_page.dart';
import 'package:basics/app/modules/presentations/new_bottom_navigator_bar/new_bottom_navigator_bar_page.dart';
import 'package:basics/app/modules/presentations/new_page_view/page_view_page.dart';
import 'package:basics/app/modules/presentations/new_form/new_form_page.dart';
import 'package:basics/app/modules/presentations/new_image/new_image_page.dart';
import 'package:basics/app/modules/presentations/new_project/new_project_page.dart';
import 'package:basics/app/modules/presentations/read_from_json/read_from_json_page.dart';
import 'package:basics/app/modules/presentations/rotations/rotations_page.dart';
import 'package:basics/app/modules/presentations/run_server/run_server_page.dart';
import 'package:basics/app/modules/presentations/sdk_superior/sdk_superior_page.dart';
import 'package:basics/app/modules/presentations/show_messages/show_messages_page.dart';
import 'package:basics/app/modules/presentations/top_menu/top_menu_page.dart';
import 'package:basics/app/modules/presentations/visibility_widget/visibility_widget_page.dart';
import 'package:basics/app/modules/presentations/voice_text/voice_text_page.dart';
import 'package:basics/app/modules/presentations/waze/waze_page.dart';
import 'package:basics/app/modules/presentations/widget_stacks/elaborated_stack_page.dart';
import 'package:basics/app/modules/presentations/widget_stacks/widget_stacks_page.dart';
import 'package:provider/provider.dart';

class PresentationsModule extends ProjetoModule {
  PresentationsModule() : super(
    routers: {
      '/newProject' : (context) => const NewProjectPage(),
      '/launchScreen' : (context) => const LaunchScreenPage(),
      '/runServer' : (context) => const RunServerPage(),
      '/topMenu' : (context) => const TopMenuPage(),
      '/containers' : (context) => const ContainersPage(),
      '/newImage' : (context) => const NewImagePage(),
      '/howNavigate' : (context) => HowNavigatePage(controller: context.read()),
      '/rotations' : (context) => const RotationsPage(),
      '/buttonsType' : (context) => const ButtonsTypePage(),
      '/exampleListView' : (context) => const ExampleListViewPage(),
      '/complexScreen' : (context) => const ComplexScreenPage(),
      '/dialogs' : (context) => const DialogsPage(),
      '/showMsg' : (context) => const ShowMessagesPage(),
      '/newForm' : (context) => const NewFormPage(),
      '/complexForm' : (context) => const ComplexFormPage(),
      '/readFromJson' : (context) => const ReadFromJsonPage(),
      '/stacks' : (context) => const WidgetStacksPage(),
      '/elaboratedStack' : (context) => const ElaboratedStackPage(),
      '/bottomNavigator' : (context) => const NewBottomNavigatorBarPage(),
      '/pageViewEx' : (context) => const PageViewPage(),
      '/elaboratedAvatar' : (context) => const ElaboratedAvatarPage(),
      '/gerenciaSetState' : (context) => const GerenciaSetStatePage(),
      '/gerenciaValueNotifier' : (context) => const GerenciaValueNotifierPage(),
      '/gerenciaChangeNotifier' : (context) => const GerenciaChangeNotifierPage(),
      '/listenerLoader': (context) => ListenerLoaderPage(controller: context.read(),),
      '/visibility': (context) => const VisibilityWidgetPage(),
      '/bottomSheet':(context) => const BottomSheetPage(),
      '/sdkSuperior':(context) => const SdkSuperiorPage(),
      '/location':(context) => const LocalMapsPage(),
      '/geolocator':(context) => const GeolocatorPage(),
      '/waze':(context) => const WazePage(),
      '/voiceText':(context) => const VoiceTextPage(),
      '/adress':(context) => const AdressNominatimPage(),
      
      //'/gerenciaProvider' : (context) => const GerenciaProviderPage(),
      //a rota passou a estar em AppWidget, pois contém uma dependência específica
      
      //'/dataBaseSqlite' : (context) => DataBaseSqlitePage(controller: context.read()),
    },
    
    //outra forma de carregar as dependências específicas
    bindings: [
      /*ChangeNotifierProvider(
        create: (_) => DataBaseController(),
      )*/

      //binding da navegação
      ChangeNotifierProvider(
        create: (context) => HowNavigateController(),
      ),

      //binding do ListenerLoader
      ChangeNotifierProvider(
        create: (context) => ListenerLoaderController()
      ),
    ]
    
  );
}