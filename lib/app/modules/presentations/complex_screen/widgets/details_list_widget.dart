import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class DetailsListWidget extends StatelessWidget {
  const DetailsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Serviço',
        style: context.textsApp.textRegular.copyWith(
          fontSize: 12, 
          color: context.colors.darkGrey
        ),
      ),
      subtitle: Text(
        r'R$',
        style: context.textsApp.textRegular.copyWith(
          fontSize: 12, 
          color: context.colors.darkGrey
        ),
      ),
      leading: const CircleAvatar(
        child: Icon(Icons.cell_tower),
      ),
      trailing: Icon(
        Icons.add_circle,
        size: 30,
        color: context.colors.darkBlue,
      ),
    );
  }
}
