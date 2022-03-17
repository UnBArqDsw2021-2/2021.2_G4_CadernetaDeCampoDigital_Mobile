import 'package:flutter/material.dart';
import 'package:caderneta_campo_digital/global/global.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Topbar extends StatelessWidget implements PreferredSizeWidget {
  final Size topbarHeight;
  const Topbar({Key? key, required this.topbarHeight}) : super(key: key);

  @override
  Size get preferredSize => topbarHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var maskFormatter = MaskTextInputFormatter(mask: "###.###.###-##");
    String name = SharedInfo.actualUser.name;
    String cpf = maskFormatter.maskText(SharedInfo.actualUser.cpf);
   
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: size.height * 0.14,
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Olá, $name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto-Bold',
              ),
            ),
            Text(
              'CPF: $cpf',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto-Regular',
              ),
            ),
          ],),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          iconSize: 50,
          color: Colors.white,
          padding: EdgeInsets.all(30),
          // ignore: no-empty-block
          onPressed: () {},
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: const [Color(0xFF0077B6), Color(0xFF90E0EF)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,),
        ),
      ),
    );
  }
}