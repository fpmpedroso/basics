import 'package:flutter/material.dart';

class ListenerLoaderPage extends StatefulWidget {

  const ListenerLoaderPage({ Key? key }) : super(key: key);

  @override
  State<ListenerLoaderPage> createState() => _ListenerLoaderPageState();
}

class _ListenerLoaderPageState extends State<ListenerLoaderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listener & Loader'),),
      body: Container(),
    );
  }
}