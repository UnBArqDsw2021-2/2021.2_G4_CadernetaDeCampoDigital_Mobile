import 'package:caderneta_campo_digital/components/alert_messenger.dart';
import 'package:caderneta_campo_digital/components/basic_components.dart';
import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/components/text_blue_button.dart';
import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/controllers/update_profile/update_profile_controller.dart';
import 'package:caderneta_campo_digital/pages/home_produtor/home_produtor.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../global/global.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  bool isLoading = false;
  String? _cpf;
  String? _name;
  String? _password;

  UpdateProfileController updateProfileController = UpdateProfileController();

  final GlobalKey<FormState> _formPropertyKey = GlobalKey<FormState>();

  void submit() async {
    _formPropertyKey.currentState!.save();

    if (!_formPropertyKey.currentState!.validate()) {
      return null;
    }

    setState(() {
      isLoading = true;
    });

    dynamic response = await updateProfileController.sendForm({
      'id': SharedInfo.actualUser.idUsuario,
      'cpf': Utils().clearMask(_cpf),
      'nome': _name,
      'password': _password,
    });

    setState(() {
      isLoading = false;
    });

    if (response != null) {
      AlertMessenger().successMessenger(context, 'Propriedade editada com sucesso!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return HomeProdutorPage();
        }),
      );
    } else {
      AlertMessenger().errorMessenger(context, 'Ocorreu um erro ao editar a propriedade');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        topbarHeight: (size * 0.10),
        title: "Editar Usuário",
        hasActions: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: isLoading
            ? Loading()
            : Form(
                key: _formPropertyKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    TextFieldBC(
                      initialValue:
                          Utils().maskCpf.maskText(SharedInfo.actualUser.cpf),
                      label: "CPF",
                      notEmpty: true,
                      minLength: 3,
                      keyboardType: TextInputType.number,
                      inputFormatters: [Utils().maskCpf],
                      onSave: (String? value) {
                        if (value != null) {
                          _cpf = value;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: TextFieldBC(
                            initialValue: SharedInfo.actualUser.name,
                            label: "Name",
                            notEmpty: true,
                            keyboardType: TextInputType.text,
                            onSave: (String? value) {
                              if (value != null) {
                                _name = value;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: TextFieldBC(
                            label: "Password",
                            notEmpty: true,
                            minLength: 1,
                            onSave: (String? value) {
                              if (value != null) {
                                _password = value;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 80),
                      child: TextBlueButton(
                        label: 'Salvar',
                        onPressed: submit,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
