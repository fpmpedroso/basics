
import 'package:flutter/material.dart';
import 'widgets/page_view_widget1.dart';
import 'widgets/page_view_widget2.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //controle de páginas para saber onde se encontra
    final controller = PageController(
      initialPage: 0,
    );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: const [
          PageViewWidget1(),
          PageViewWidget2(),
        ],
      ),
    );
  }
}
