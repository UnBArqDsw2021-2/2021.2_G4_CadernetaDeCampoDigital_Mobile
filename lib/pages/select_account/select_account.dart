import 'package:caderneta_campo_digital/components/icon_text_button.dart';
import 'package:caderneta_campo_digital/pages/register/producer_register/producer_register_page.dart';
import 'package:caderneta_campo_digital/pages/register/technician_register/technician_register_page.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';

class SelectAccountPage extends StatelessWidget {
  const SelectAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0XFF0077B6),
              Color(0XFF00B4D8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.049,
                    bottom: size.height * 0.18,
                  ),
                  child: Text(
                    "Qual tipo de conta deseja cadastrar ?",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              IconTextButton(
                'Técnico',
                size,
                Icon(
                  Icons.handyman_rounded,
                  color: Color(0XFF03045E),
                  size: size.width * 0.07,
                ),
                0.15,
                borderColor: MyColors().white,
                splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return TechnicianRegisterPage();
                })),
              ),
              IconTextButton(
                'Produtor',
                size,
                Icon(
                  Icons.agriculture,
                  color: MyColors().darkBlue,
                  size: size.width * 0.07,
                ),
                0.15,
                borderColor: Colors.white,
                splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProducerRegisterPage();
                })),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.073),
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
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
