import 'package:flutter/material.dart';

class RoundedImagebutton extends StatelessWidget {
  final contents;
  final String image;
  final Color? backgroundColor;
  final onPressed;
  final bool isAssetImage;

  const RoundedImagebutton({
    Key? key,
    required this.contents,
    required this.image,
    required this.isAssetImage,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius border = BorderRadius.circular(15);
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: border,
        ),
        elevation: 4,
        child: InkWell(
          borderRadius: border,
          onTap: onPressed,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                // color: MyColors().blue,
                child: ClipRRect(
                  borderRadius: border,
                  child: Container(
                    color: backgroundColor,
                    height: size.width * 0.17,
                    width: size.width * 0.17,
                    child: isAssetImage
                        ? Image(
                            image: AssetImage(image),
                            fit: BoxFit.scaleDown,
                            height: size.width * 0.15,
                            width: size.width * 0.15,
                          )
                        : Image.network(
                            image,
                            fit: BoxFit.scaleDown,
                            height: size.width * 0.15,
                            width: size.width * 0.15,
                          ),
                  ),
                ),
              ),
              contents,
            ],
          ),
        ),
      ),
    );
  }
}
