import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseAuthentication extends StatelessWidget {
  final String label;
  final bool isLoading;
  final child;

  const BaseAuthentication({
    Key? key,
    required this.label,
    this.isLoading = false,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/authentication/Detail1.svg",
                  width: size.width,
                ),
                isLoading
                    ? Container()
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 80),
                          child: Text(
                            label,
                            style: TextStyle(
                              fontSize: 36,
                              color: MyColors().white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SvgPicture.asset("assets/logo.svg"),
            ),
            isLoading
                ? (SizedBox(
                    height: size.height * 0.65,
                    child: Loading(),
                  ))
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: child,
                  ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset("assets/authentication/Detail2.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
