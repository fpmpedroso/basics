import 'package:basics/app/core/ui/helpers/messages.dart';
import 'package:basics/app/core/ui/styles/buttons_app.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/core/ui/widgets/button_widget.dart';
import 'package:basics/app/core/ui/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

part 'widgets/login_form.dart';

class ComplexFormPage extends StatelessWidget {

  const ComplexFormPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário completo'),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/img_logo.png',
                    width: 160,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const LoginForm(),
              ]
            ),
          ),
        ),
      ),
    );
  }
}