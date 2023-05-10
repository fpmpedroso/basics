// inicia-se a chave do formulário para ter acesso ao seu State;
// validator: serve para validar os campos do formulário. Retornar um texto se contiver erro;
// validator é acionado pela chave.currentState.validate() tendo true para correto;
// controller: nada mais é do que armazenar os valores dos campos para poder usar;
// ao final, deve-se descartar os valores armazenados na memória.''',

import 'package:basics/app/core/ui/helpers/messages.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class NewFormPage extends StatefulWidget {
  const NewFormPage({Key? key}) : super(key: key);

  @override
  State<NewFormPage> createState() => _NewFormPageState();
}

class _NewFormPageState extends State<NewFormPage> with Messages<NewFormPage> {
  //texto do ex 1)
  String txtExample1 = '';

  //chave para validação, ex 2
  final _formKey = GlobalKey<FormState>();

  //controladora que serve para resgatar valores
  final _formEC = TextEditingController();

  //armazenamento do valor do select(DropdownButtonFormField), ex. 8
  String valueSelected = 'cat01';

  //método dispose para descarregar todas as controladoras que armazenam info na memória
  @override
  void dispose() {
    super.dispose();
    _formEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulários'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# Trabalhando com formulários',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '1) TextField: a maneira mais fácil e sem muitos recursos (não pode ser validado)',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (String value) {
                        setState(() {
                          txtExample1 = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Texto digitado: $txtExample1'),
                  ],
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''2) TextFormField: o mais usado (completo)
                > a classe Form possui um estado, por ser StateFulWidget.
                > é possível fazer a validação através de uma GlobalKey''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            //se retonar significa que está inválido, caso contrário está em ordem
                            return 'campo não preenchido';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '4) TextFormField com controlador para resgatar os valores',
                        style: context.textsApp.textRegular.copyWith(
                            fontSize: 14, color: context.colors.darkGrey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(children: [
                          TextFormField(
                            controller:
                                _formEC, //controladora que resgata o conteúdo
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'campo obrigatório';
                              } else {
                                return null;
                              }
                            },
                          ),
                          ElevatedButton(
                              onPressed: () {
                                var formValid =
                                    _formKey.currentState?.validate() ?? false;

                                if (formValid) {
                                  showSuccess(
                                      'Form válido :). Msg resgatada ${_formEC.text}');
                                } else {
                                  showError('Form inválido :(');
                                }
                              },
                              child: const Text('Salvar')),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''5) Toda vez que resgatar valor em uma controladora, deve descarregá-la quando finalizar seu uso
                > utiliza-se o método dispose''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''6) Mais de um Form na mesma página:
                > deve-se ter GlobalKey diferente (variáveis diferentes)''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '7) Customização do formulário (correto é a config. no tema)',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: context.textsApp.textBold,
                    isDense: true, //deixa o texto mais compacto
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: context.colors.darkOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: context.colors.lightBlue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: context.colors.darkBlue),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: context.colors.redWarning),
                    ),
                  ),
                  maxLines:
                      null, //valores absolutos a partir de 1 ou null para ser ajustável
                  //obscureText: true,  //campo senha
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '8) DropdownButtonFormField',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: DropdownButtonFormField<String>(
                  value: valueSelected, //item inicialmente mostrado
                  /*
                  caso queira validar, segue a mesma regra
                  validator: (String? value){
                    if (value == null || value.isEmpty) {
                      return 'campo não preenchido';
                    } else {
                      return null;
                    }
                  },*/
                  onChanged: (String? newValue) {
                    //altera-se o valor selecionado
                    if (newValue != null) {
                      setState(() {
                        valueSelected = newValue;
                      });
                    }
                  },
                  elevation: 15, //elevação da tela
                  icon: const Icon(
                      Icons.abc), //troca o ícone da setinha do select
                  decoration: InputDecoration(
                    labelText: 'Selecione',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: context.colors.darkOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: context.colors.lightBlue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: context.colors.darkBlue),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: context.colors.redWarning),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'cat01',
                      child: Text('opção 1'),
                    ),
                    DropdownMenuItem(
                      value: 'cat02',
                      child: Text('opção 2'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
