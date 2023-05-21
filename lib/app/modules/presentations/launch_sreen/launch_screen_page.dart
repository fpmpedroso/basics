import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class LaunchScreenPage extends StatelessWidget {

  const LaunchScreenPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Launch Sreen & Nome App'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# Como alterar ícone e splash screen?',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '1) Alterar o ícone para Android:',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''> abra o arquivo android/app/src/main/AndroidManifest.xml
                  > altere a tag android:label="nome desejado" ''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '2) Alterar o ícone para IOS:',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''> abra o arquivo ios/Runner/info.plist
                  > altere a tag <key>CFBundleName</key>
	                                  <string>nome desejado</string>
                  > ao configurar IOS, verificar a tag <key>CFBundleDisplayName</key>, (não testei)''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Text(
                '1) Para Android:',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''> abrir a pasta android/app/src/main/res/...
                > poderá ser drawable ou drawable-v21, dependendo da versão que está sendo usada''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> no arquivo .xml é possível trocar a cor de fundo',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              Text(
                '<item android:drawable="@android:color/white" />',
                style: context.textsApp.textRegular.copyWith(
                  fontSize: 14, 
                  color: context.colors.whiteApp, 
                  backgroundColor: Colors.black
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> para trocar a imagem, basta colocá-la nas pastas drawable e drawable-v21',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> descomenta-se a inserção da imagem desejada e corrige o caminho/nome do arquivo sem extensão',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}