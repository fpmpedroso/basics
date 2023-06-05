import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter/material.dart';

class ListViewDados extends StatelessWidget {
  const ListViewDados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.percentWidth(0.8),
      height: context.percentWidth(0.6),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 10),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Text('item: $index');
        },
      ),
    );
  }
}
