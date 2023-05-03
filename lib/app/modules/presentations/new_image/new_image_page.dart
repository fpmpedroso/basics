import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewImagePage extends StatelessWidget {
  const NewImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLogger log = context.read<AppLogger>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Imagem'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# Manipulação de imagens',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '> configuração do pubspec.yaml',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> 1) Uso comum com "Image.asset":',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset('assets/images/img_demo.jpeg'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> 1.1.) "fit cover"',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: context.percentWidth(0.8),
                  height: context.percentWidth(0.5),
                  color: context.colors.lightBlue,
                  child: Image.asset(
                    'assets/images/img_demo.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> 1.2.) "fit fill"',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: context.percentWidth(0.8),
                  height: context.percentWidth(0.5),
                  color: context.colors.lightBlue,
                  child: Image.asset(
                    'assets/images/img_demo.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> 1.3.) "fit contain"',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: context.percentWidth(0.8),
                  height: context.percentWidth(0.5),
                  color: context.colors.lightBlue,
                  child: Image.asset(
                    'assets/images/img_demo.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> 2) "Image.network" com possível erro de carregamento',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: context.percentWidth(0.8),
                  height: context.percentWidth(0.5),
                  color: context.colors.lightBlue,
                  child: Image.network(
                    'https://turistaprofissional.com/wp-content/uploads/2016/10/aurora-boreal-na-noruega.jpg',
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      log.error('Img não carregou', error, stackTrace);
                      return Image.asset(
                        'assets/images/img_demo.jpeg',
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> 3) "FadeInImage": serve para carregar a img antes de mostrá-la',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/img_loading.gif',
                  image: 'https://www.thetimes.co.uk/travel/wp-content/uploads/sites/6/2022/05/HERO_Thai-traditional-wooden-longtail-boat-and-beautiful-sand-Railay-Beach-in-Krabi-province.-Ao-Nang-Thailand_Credit_GettyImages-1011241694.jpg?w=2200&h=880&crop=1',
                  width: context.percentWidth(0.6),
                  height: context.percentWidth(0.6),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
