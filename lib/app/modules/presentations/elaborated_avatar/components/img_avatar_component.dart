import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ImgAvatarComponent extends StatelessWidget {
  final String urlImage;

  const ImgAvatarComponent({Key? key, required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colors.darkBlue,
                context.colors.lightBlue
              ],
              begin: Alignment.topCenter
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(urlImage),
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: context.colors.redWarning,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text(
                'AO VIVO',
                style: context.textsApp.textBold.copyWith(
                  fontSize: 8,
                  color: context.colors.whiteApp,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
