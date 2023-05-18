import 'package:basics/app/modules/presentations/elaborated_avatar/components/img_avatar_component.dart';
import 'package:flutter/material.dart';

class ElaboratedAvatarPage extends StatelessWidget {

  const ElaboratedAvatarPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar'),),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: ImgAvatarComponent(
          urlImage: 'https://1.bp.blogspot.com/-KLg5TEY1v6U/T6P9I6YPZwI/AAAAAAAABEc/iYpstw_ouMQ/s1600/Mr_bean.jpg',
        ),
      )
    );
  }
}