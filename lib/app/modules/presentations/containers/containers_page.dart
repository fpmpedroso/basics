import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ContainersPage extends StatelessWidget {

  const ContainersPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Containers'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 6, right: 6, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# Configurando um container?',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '> 1) "padding" é o espaçamento da parte interna do widget (laranja)',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> 2) "margin" é o espaçamento da parte externa do widget (cinza)',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: context.percentWidth(0.5),
                height: context.percentWidth(0.5),
                color: context.colors.lightGrey,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(30),
                  color: context.colors.darkOrange,
                  child: const Text('paddin de 10'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '> 3) "BoxDecoration" para personalização do container',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: context.percentWidth(0.5),
                height: context.percentWidth(0.5),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: context.colors.darkGrey,
                      blurRadius: 20,
                      offset: const Offset(-5, -5),
                    ),
                    BoxShadow(
                      color: context.colors.darkBlue,
                      blurRadius: 20,
                      offset: const Offset(20,20),
                    ),
                  ]
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '> 4) imagem como background',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: context.percentWidth(0.5),
                height: context.percentWidth(0.5),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/img_demo.jpeg'),
                    fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> 5) Degradê',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: context.percentWidth(0.5),
                height: context.percentWidth(0.5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colors.darkBlue,
                      context.colors.lightBlue,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}