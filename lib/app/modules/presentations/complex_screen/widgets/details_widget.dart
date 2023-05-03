import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Center(
            child: Text(
              'Título da página',
              style: context.textsApp.textBold.copyWith(
                fontSize: 16, 
                color: context.colors.darkGrey
              ),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: context.colors.lightGrey,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
              'Subtítulo',
              style: context.textsApp.textBold.copyWith(
                fontSize: 14, 
                color: context.colors.darkGrey
              ),
            ),
        ),
        ListTile(
          leading: Icon(
            Icons.location_city,
            color: context.colors.darkGrey,
          ),
          title: Text(
            'nononono',
            style: context.textsApp.textRegular.copyWith(
              fontSize: 12, 
              color: context.colors.darkGrey
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.local_phone,
            color: context.colors.darkGrey,
          ),
          title: Text(
            '00-00000-0000',
            style: context.textsApp.textRegular.copyWith(
              fontSize: 12, 
              color: context.colors.darkGrey
            ),
          ),
        ),
         Divider(
          thickness: 1,
          color: context.colors.lightGrey,
        ),
      ],
    );
  }
}
