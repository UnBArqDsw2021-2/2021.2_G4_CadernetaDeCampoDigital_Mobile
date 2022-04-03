import 'package:flutter/material.dart';

class PageBase extends StatelessWidget {
  final String title;
  final child;
  const PageBase({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: const [
                0.2,
                1,
              ],
              colors: const <Color>[
                Color.fromARGB(255, 0, 119, 182),
                Color.fromARGB(255, 144, 224, 239),
              ],
            ),
          ),
        ),
        leading: Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(left: 10),
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            VerticalDivider(
              thickness: 1,
              color: Colors.white,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: child,
      ),
    );
  }
}
