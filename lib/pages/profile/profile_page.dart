import 'package:caderneta_campo_digital/pages/profile/components/profile_text.dart';
import 'package:flutter/material.dart';
import '../../components/icon_text_button.dart';
import '../register/producer_register/producer_register_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              Container(
                margin: EdgeInsets.only(top: size.height * 0.07),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: size.width * 0.35,
                ),
              ),
              ProfileText('Fulano da Silva'),
              ProfileText('000.000.000-01'),
              ProfileText('Técnico'),
              ProfileText('Informação 1'),
              ProfileText('Informação 2'),
              ProfileText('Informação 3'),
              IconTextButton(
                'Editar',
                size,
                Icon(
                  Icons.edit,
                  color: Color(0XFF03045E),
                  size: size.width * 0.07,
                ),
                0.02,
                borderColor: Colors.white,
                splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProducerRegisterPage();
                })),
              ),
              IconTextButton(
                'Sair',
                size,
                Icon(
                  Icons.exit_to_app,
                  color: Color.fromRGBO(176,37,37,1),
                  size: size.width * 0.07,
                ),
                0.02,
                borderColor: Color.fromRGBO(176,37,37,1),
                textColor: Color.fromRGBO(176,37,37,1),
                backgroundColor: Colors.transparent,
                splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProducerRegisterPage();
                })),
              ),
              IconTextButton(
                'Excluir',
                size,
                Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: size.width * 0.07,
                ),
                0.02,
                borderColor: Color.fromRGBO(176,37,37,1),
                textColor: Colors.white,
                backgroundColor: Color.fromRGBO(176,37,37,1),
                splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProducerRegisterPage();
                })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
