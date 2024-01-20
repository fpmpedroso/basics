import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/modules/home/widgets/components/item_row_component.dart';
import 'package:flutter/material.dart';

class RowMenuWidget extends StatelessWidget {
  
  const RowMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Novo Projeto', 
                iconItem: Icons.add_box_outlined,
                urlItem: '/newProject',
              ),
              ItemRowComponent(
                textItem: 'Splash Screen', 
                iconItem: Icons.add_to_home_screen,
                urlItem: '/launchScreen',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Iniciar Servidor', 
                iconItem: Icons.computer_outlined,
                urlItem: '/runServer',
              ),
              ItemRowComponent(
                textItem: 'Menus', 
                iconItem: Icons.menu,
                urlItem: '/topMenu',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Containers', 
                iconItem: Icons.move_to_inbox,
                urlItem: '/containers',
              ),
              ItemRowComponent(
                textItem: 'Imagens', 
                iconItem: Icons.picture_in_picture_alt_outlined,
                urlItem: '/newImage',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Navegação', 
                iconItem: Icons.assistant_navigation,
                urlItem: '/howNavigate',
              ),
              ItemRowComponent(
                textItem: 'Rotação', 
                iconItem: Icons.turn_right_outlined,
                urlItem: '/rotations',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Botões', 
                iconItem: Icons.smart_button_outlined,
                urlItem: '/buttonsType',
              ),
              ItemRowComponent(
                textItem: 'ListView', 
                iconItem: Icons.checklist_outlined,
                urlItem: '/exampleListView',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Complex Screen',  
                iconItem: Icons.close_fullscreen_outlined,
                urlItem: '/complexScreen',
              ),
              ItemRowComponent(
                textItem: 'Dialogs', 
                iconItem: Icons.perm_scan_wifi_outlined,
                urlItem: '/dialogs',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Formulário', 
                iconItem: Icons.dynamic_form_outlined,
                urlItem: '/newForm',
              ),
              ItemRowComponent(
                textItem: 'Show Msg', 
                iconItem: Icons.perm_phone_msg_outlined,
                urlItem: '/showMsg',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Complex form',  
                iconItem: Icons.dynamic_feed_sharp,
                urlItem: '/complexForm',
              ),
              ItemRowComponent(
                textItem: 'Read Json', 
                iconItem: Icons.data_object_outlined,
                urlItem: '/readFromJson',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'BottomNavigator', 
                iconItem: Icons.vertical_align_bottom_outlined,
                urlItem: '/bottomNavigator',
              ),
              ItemRowComponent(
                textItem: 'Widget Stack', 
                iconItem: Icons.stacked_bar_chart,
                urlItem: '/stacks',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'PageView',  
                iconItem: Icons.pageview_outlined,
                urlItem: '/pageViewEx',
              ),
              ItemRowComponent(
                textItem: 'Avatar',
                iconItem: Icons.broadcast_on_personal_sharp,
                urlItem: '/elaboratedAvatar',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'SetState',  
                iconItem: Icons.waving_hand_outlined,
                urlItem: '/gerenciaSetState',
              ),
              ItemRowComponent(
                textItem: 'ValueNotifier',
                iconItem: Icons.waving_hand_outlined,
                urlItem: '/gerenciaValueNotifier',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'ChangeNotifier', 
                iconItem: Icons.waving_hand_outlined,
                urlItem: '/gerenciaChangeNotifier',
              ),
              ItemRowComponent(
                textItem: 'Provider',
                iconItem: Icons.waving_hand_outlined,
                urlItem: '/gerenciaProvider',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Loader', 
                iconItem: Icons.downloading_outlined,
                urlItem: '/listenerLoader',
              ),
              ItemRowComponent(
                textItem: 'Visibility',
                iconItem: Icons.remove_red_eye_outlined,
                urlItem: '/visibility',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'BD interno',
                iconItem: Icons.adb_outlined,
                urlItem: '/dataSqlitePage',
              ),
              ItemRowComponent(
                textItem: 'Home Antiga',
                iconItem: Icons.home_outlined,
                urlItem: '/home',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'BottomSheet', 
                iconItem: Icons.account_box_outlined, 
                urlItem: '/bottomSheet',
              ),
              ItemRowComponent(
                textItem: 'SdkSuperior', 
                iconItem: Icons.android, 
                urlItem: '/sdkSuperior',
              )
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Location', 
                iconItem: Icons.map_outlined, 
                urlItem: '/location',
              ),
              ItemRowComponent(
                textItem: 'none', 
                iconItem: Icons.android, 
                urlItem: '',
              )
            ],
          ),
        ],
      ),
    );
  }
}
