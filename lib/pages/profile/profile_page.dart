import 'dart:math';
import 'package:caderneta_campo_digital/controllers/profile/profile_controller.dart';
import 'package:caderneta_campo_digital/pages/profile/components/profile_text.dart';
import 'package:flutter/material.dart';
import '../../components/icon_text_button.dart';
import '../../global/colors.dart';
import '../../global/global.dart';
import '../../utils/utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String name = SharedInfo.actualUser.name;
    String cpf = Utils().maskCpf.maskText(SharedInfo.actualUser.cpf);
    String accountType =
        SharedInfo.actualUser.isProductor ? "Produtor" : "Técnico";

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Icon(
                    Icons.person,
                    color: MyColors().white,
                    size: min(size.width * 0.35, size.height * 0.35),
                  ),
                ProfileText(name),
                ProfileText(cpf),
                ProfileText(accountType),
                (accountType == 'Produtor')
                    ? ProfileText('DAP')
                    : ProfileText('CREA'),
                IconTextButton(
                  'Editar',
                  size,
                  Icon(
                    Icons.edit,
                    color: MyColors().darkBlue,
                    size: size.width * 0.07,
                  ),
                  0.5,
                  0.07,
                  0.03,
                  borderColor: MyColors().white,
                  splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                  onPressed: () => {ProfileController().logout(context)},
                ),
                
                IconTextButton(
                  'Sair',
                  size,
                  Icon(
                    Icons.exit_to_app,
                    color: Color.fromRGBO(176, 37, 37, 1),
                    size: size.width * 0.07,
                  ),
                  0.5,
                  0.07,
                  0.03,
                  borderColor: Color.fromRGBO(176, 37, 37, 1),
                  textColor: Color.fromRGBO(176, 37, 37, 1),
                  backgroundColor: Colors.transparent,
                  splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                  onPressed: () => {ProfileController().logout(context)},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
