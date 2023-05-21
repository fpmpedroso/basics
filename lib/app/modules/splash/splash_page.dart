// página de entrada do sistema
// contém uma extensão de mixin do loader ("with Loader")
// contém uma extensão de mixin do package de msg ao usuário

import 'dart:async';

import 'package:basics/app/core/ui/helpers/loader.dart';
import 'package:basics/app/core/ui/helpers/messages.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with Loader<SplashPage>, Messages<SplashPage> {
  
  //função para aguardar 3s e levar o usuário para Home
  void startTimer() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).popAndPushNamed('/home');
    });
  }

  @override
  void initState() {
    super.initState();

    /*/ao carregar a página aguarda 3s para ir para página principal
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //await Future.delayed(const Duration(seconds: 3));
      //Navigator.of(context).pushNamed('/home');
      startTimer();
      Navigator.of(context).popAndPushNamed('/home');
    });*/
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                'assets/images/img_logo.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('class ',
                    style: TextStyle(
                      fontFamily: 'FiraCode',
                      fontWeight: FontWeight.w300,
                      color: context.colors.whiteApp,
                      fontSize: 15,
                      backgroundColor: Colors.black,
                    )),
                Text(
                  ' BASICS  ',
                  style: context.textsApp.textBold.copyWith(
                    fontSize: 20,
                    color: context.colors.darkOrange,
                  ),
                ),
                Text('{',
                    style: TextStyle(
                        fontFamily: 'FiraCode',
                        fontWeight: FontWeight.w300,
                        color: context.colors.whiteApp,
                        fontSize: 15,
                        backgroundColor: Colors.black)),
              ],
            ),
            Text('  (_) => sua Fábrica de Apps;',
                style: TextStyle(
                    fontFamily: 'FiraCode',
                    fontWeight: FontWeight.w300,
                    color: context.colors.darkGrey,
                    fontSize: 15)),
            Text(
              '}',
              style: TextStyle(
                  fontFamily: 'FiraCode',
                  fontWeight: FontWeight.w300,
                  color: context.colors.whiteApp,
                  fontSize: 15,
                  backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
