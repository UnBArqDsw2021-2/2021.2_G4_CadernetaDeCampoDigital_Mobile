import 'package:flutter/material.dart';

class Topbar extends StatelessWidget implements PreferredSizeWidget {
  final Size topbarHeight;
  const Topbar({Key? key, required this.topbarHeight}) : super(key: key);

  @override
  Size get preferredSize => topbarHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      toolbarHeight: size.height * 0.14,
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Olá, José',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto-Bold',
              ),
            ),
            Text(
              'CPF: 55555555555',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto-Regular',
              ),
            ),
          ]),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          iconSize: 50,
          padding: EdgeInsets.all(30),
          onPressed: () {},
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF0077B6), Color(0xFF90E0EF)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
    );
  }
}