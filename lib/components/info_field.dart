import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  final String label;
  final String child;
  const InfoField({Key? key, required this.label, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
        ),
        child: Text(
          '$label: $child',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.black.withOpacity(0.35)),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
