import 'package:flutter/material.dart';

class SelectTypePage extends StatelessWidget {
  const SelectTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0XFF0077B6),
          Color(0XFF00B4D8),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 40, bottom: 150),
                child: Text(
                  "Qual tipo de conta deseja cadastrar ?",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: MaterialButton(
                onPressed: () {},
                splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                highlightColor: Colors.transparent,
                child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Icon(
                            Icons.handyman_rounded,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 1,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.06),
                          child: Text(
                            "TÉCNICO",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 70),
              child: MaterialButton(
                onPressed: () {},
                splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                highlightColor: Colors.transparent,
                child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Icon(
                            Icons.agriculture,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 1,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.04),
                          child: Text(
                            "PRODUTOR",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.transparent,
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    "Cancelar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.underline),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
