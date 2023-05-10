// declara-se um array de cidades inicialmente vazio;
// cria-se um listView do tipo build (pois não se sabe a qtd de cidades);
// no initState, referencia-se um método assíncrono para leitura do json;
// referencia-se qual o arquivo json irá executar e armazena a string em uma variável;
// dentro do setState, faz a conversão da string para list;
// varre-se a lista e a transforma em um objeto de cidade;

//foi usado um mixin do loader para simular o carregamento assíncrono

import 'dart:convert';

import 'package:basics/app/core/Exceptions/failure.dart';
import 'package:basics/app/core/ui/helpers/loader.dart';
import 'package:basics/app/core/ui/helpers/messages.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/modules/presentations/read_from_json/models/cidades_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadFromJsonPage extends StatefulWidget {
  const ReadFromJsonPage({Key? key}) : super(key: key);

  @override
  State<ReadFromJsonPage> createState() => _ReadFromJsonPageState();
}

class _ReadFromJsonPageState extends State<ReadFromJsonPage>
    with Loader<ReadFromJsonPage>, Messages<ReadFromJsonPage> {
  var cidades = <CidadesModel>[];

  @override
  void initState() {
    super.initState();
    _loadCities(); //na forma de método devido ser assíncrono
  }

  //método para leitura do json
  //não pode estar dentro do initState por ser assíncrono
  Future<void> _loadCities() async {
    try {
      //carrega-se o arquivo json
      final cidadesJson =
          await rootBundle.loadString('assets/json/cidades.json');

      //loader para simular carregamento
      showLoader();
      await Future.delayed(const Duration(seconds: 2));

      //atualiza o estado
      setState(() {
        //faz a conversão de json (string) para uma lista
        var cidadesList = json.decode(cidadesJson);

        //throw Failure(message: 'Oops.. erro ao carregar');
        //throw Exception('outro erro');

        //converto a lista em um mapa
        cidades = cidadesList
            .map<CidadesModel>((city) => CidadesModel.fromMap(city))
            .toList();
      });

      hideLoader();
    
    //ao existir algum erro tratado
    } on Failure catch (e) {
      showError(e.message.toString());
    
    //ao existir algum erro qualquer
    } catch (e) {
      showError(e.toString());
    
    //sempre vai finalizar escondendo o loading
    } finally {
      hideLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leitura Json'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Como fazer a leitura de um arquivo Json',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '> Uma boa estratégia para carregar textos que acompanham o projeto (não tem BD)',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cidades.length,
                itemBuilder: (context, index) {
                  var itemCidade = cidades[index];
                  return ListTile(
                    title: Text(itemCidade.cidade),
                    subtitle: Text(itemCidade.estado),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
