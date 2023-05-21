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
                '# Como alterar nome, ícone e splash screen do App?',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '1) Alterar o nome do App para Android:',
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
                '2) Alterar o nome do App para IOS:',
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
              const SizedBox(
                height: 20,
              ),
              Text(
                '3) Alterar a Splash Screen:',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''> baixar o package flutter_native_splash
                  > criar em asset/images/ uma imagem 1024x1024 do ícone desejado (preferência quadrada)
                  > criar o seguinte script dentro do pubspec.yaml: ''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''flutter_native_splash:
                      color: "#1E90FF"
                      image: "assets/images/splash_screen.png"
                      android: true
                      ios: true
                      
                      android_12:
                        image: "assets/images/splash_screen.png"''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.whiteApp, backgroundColor: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''> roda-se o comando flutter pub run flutter_native_splash:create''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text(
                '4) Alterar o ícone:',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''> baixar o package flutter_launcher_icons
                  > criar em asset/images/ uma imagem do ícone desejado (1024x1024)
                  > cria-se duas imagens, uma com fundo outra transparente (alternativa)
                  > criar o seguinte script dentro do pubspec.yaml: ''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''flutter_launcher_icons:
                      android: "launcher_icon"
                      ios: true
                      remove_alpha_ios: true
                      image_path: "assets/images/icon.png"  #normalmente ícone quadrado
                      min_sdk_android: 21
                      adaptive_icon_background: "#000000"
                      adaptive_icon_foreground: "assets/images/icon.png"''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.whiteApp, backgroundColor: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> em adaptive_icon_foreground coloca-se a img com fundo transparente (recortes)',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> roda-se o comando: flutter pub run flutter_launcher_icons',
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