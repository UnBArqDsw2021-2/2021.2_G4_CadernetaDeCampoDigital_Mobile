import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final String label;
  final Size size;
  final Icon icon;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? splashColor;
  final Function? onPressed;

  const IconTextButton(
    this.label, this.size, this.icon, {
    Key? key,
    this.textColor,
    this.backgroundColor,
    this.onPressed,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.width * 0.15),
      child: MaterialButton(
        // ignore: no-empty-block
        onPressed: () => onPressed,
        splashColor: splashColor,
        highlightColor: Colors.transparent,
        child: Container(
          height: size.height * 0.07,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: icon,
              ),
              Container(
                height: size.height * 0.043,
                width: 1,
                color: Color(0XFF03045E),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.037),
                child: Text(
                  label,
                  style: TextStyle(fontSize: size.width * 0.06, color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
