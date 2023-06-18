import 'package:basics/app/modules/home/widgets/appbar_widget.dart';
import 'package:basics/app/modules/home/widgets/row_menu_widget.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {

  const HomePage2({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AppbarWidget(),
            SizedBox(
              height: 30,
            ),
            RowMenuWidget(),
          ],
        ),
      ),
    );
  }
}