import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppLogger log = context.read<AppLogger>();

    return Stack(
      children: [
        Container(
          width: context.screenWidth,
          height: context.percentWidth(0.7),
          color: context.colors.whiteApp,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 25,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/img_loading.gif',
            imageErrorBuilder:(context, error, stackTrace) {
              log.error('Img não carregou', error, stackTrace);
              return Image.asset(
                'assets/images/img_demo.jpeg',
                fit: BoxFit.cover,
              );
            },
            image: 'https://siditur.com.br/uploads/dica/12/coliseu-roma.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: context.percentWidth(0.7) / 2,
          left: 10,
          right: 10,
          child: Center(
            child: Text(
              'HELLO USER',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 20, color: context.colors.whiteApp),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'TÍTULO DO BANNER',
                        style: context.textsApp.textBold.copyWith(
                            fontSize: 12, color: context.colors.darkGrey),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 2, bottom: 10),
                      child: Text(
                        'Texto banner',
                        style: context.textsApp.textRegular.copyWith(
                            fontSize: 12, color: context.colors.darkGrey),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25, top: 5, bottom: 5),
                  child: Icon(
                    Icons.account_balance,
                    size: 30,
                    color: context.colors.lightGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
