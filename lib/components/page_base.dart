import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:flutter/material.dart';

class PageBase extends StatelessWidget {
  final String title;
  final child;
  final bool isLoading;

  const PageBase({
    Key? key,
    required this.title,
    required this.child,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        title: title,
        topbarHeight: Size.fromHeight(70),
        hasActions: false,
      ),
      body: isLoading
          ? SizedBox(
              height: size.height * 0.65,
              child: Loading(),
            )
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: child,
            ),
    );
  }
}
