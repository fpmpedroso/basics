import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ElaboratedStackPage extends StatelessWidget {

  const ElaboratedStackPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elaborated Stack'),),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://portaldeinverno.com.br/wp-content/uploads/2017/02/copenhague-dinamarca-1.jpg',
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 10,
            right: 10,
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Copenhague',
                      style: context.textsApp.textBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '   Copenhague, a capital da Dinamarca, fica localizada nas ilhas costeiras de Zelândia e Amager. Ela se liga a Malmö, na parte sul da Suécia, pela Ponte do Øresund. O centro histórico da cidade, chamado de Indre By, contém Frederiksstaden, uma área rococó do século XVIII que abriga o Palácio de Amalienborg da família real.',
                      style: context.textsApp.textRegular,
                      textAlign: TextAlign.justify,
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}