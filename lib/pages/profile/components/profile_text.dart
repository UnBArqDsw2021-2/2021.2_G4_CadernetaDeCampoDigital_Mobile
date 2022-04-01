import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  final String label;

  const ProfileText(this. label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.width * 0.05),
      child: Text(
        label ,
        style: TextStyle(fontSize: size.width * 0.05, color: Colors.white),
      ),
    );
  }
}
