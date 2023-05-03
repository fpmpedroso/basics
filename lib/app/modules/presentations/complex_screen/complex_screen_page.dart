/*Exemplo advindo do CuidaPet;
    possui:
      1) CustomScrollView: serve para administrar mais de um ScrollView na tela. Muito importante seu uso
        quando é necessário otimizar o uso de listas com scrolls;
      2) O título é flexível: qando a imagem é grande o título aparece no body, quando a imagem é pequena,
        o título aparece na appBar;
      
*/

import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

import 'widgets/details_list_widget.dart';
import 'widgets/details_widget.dart';

class ComplexScreenPage extends StatefulWidget {
  const ComplexScreenPage({Key? key}) : super(key: key);

  @override
  State<ComplexScreenPage> createState() => _ComplexScreenPageState();
}

class _ComplexScreenPageState extends State<ComplexScreenPage> {
  //controle do título flexível
  //verifica se a imagem já foi extendida o máximo que podia e se atinge um tamanho determinado
  //com o resultado muda-se a visibilidade do título na appBar para true ou false
  late ScrollController _scrollController;
  bool sliverCollapsed = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 180 &&
          !_scrollController.position.outOfRange) {
        setState(() {
          sliverCollapsed = true;
        });
      }else if (_scrollController.offset <= 180 &&
          !_scrollController.position.outOfRange){
        setState(() {
          sliverCollapsed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('FloatActionButton'),
        icon: const Icon(Icons.schedule),
        backgroundColor: context.colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        controller: _scrollController, //para controlar o título flexível
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true, //serve para reduzir quando rola a página
            title: Visibility(
              visible: sliverCollapsed,
              child: const Text('Título da página'),
            ),
            flexibleSpace: FlexibleSpaceBar(
              //permite inserir itens na AppBar quando aumenta/diminui de tamanho
              stretchModes: const [
                StretchMode.blurBackground, //diminui o background
                StretchMode.fadeTitle, //faz um efeito de fade
              ],
              background: Image.network(
                'https://siditur.com.br/uploads/dica/12/coliseu-roma.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            //tipo de sliver simples que se adapta na tela
            child: DetailsWidget(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Nonono',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
            ),
          ),
          SliverList(
            //lista inteligente que carrega/descarrega conforme necessidades
            delegate:
                SliverChildBuilderDelegate(childCount: 200, (context, index) {
              return const DetailsListWidget();
            }),
          ),
        ],
      ),
    );
  }
}
