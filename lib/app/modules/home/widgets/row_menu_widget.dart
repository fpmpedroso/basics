import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Novo projeto', 
                colorItem: context.colors.darkBlue, 
                iconItem: Icons.add_box_outlined,
                urlItem: '/newProject',
              ),
              ItemRowComponent(
                textItem: 'SplashScreen', 
                colorItem: context.colors.darkOrange,
                iconItem: Icons.add_to_home_screen,
                urlItem: '/launchScreen',
              ),
            ],
          ),
          SizedBox(
            height: context.percentWidth(.05),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemRowComponent(
                textItem: 'Iniciar servidor', 
                colorItem: context.colors.darkBlue, 
                iconItem: Icons.computer_outlined,
                urlItem: '/runServer',
              ),
              ItemRowComponent(
                textItem: 'SplashScreen', 
                colorItem: context.colors.darkBlue,
                iconItem: Icons.add_to_home_screen,
                urlItem: '/launchScreen',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
