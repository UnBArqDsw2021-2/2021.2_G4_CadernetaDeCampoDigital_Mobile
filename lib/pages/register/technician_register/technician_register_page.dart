import 'package:caderneta_campo_digital/components/BaseAuthentication/main.dart';
import 'package:caderneta_campo_digital/components/alert_messenger.dart';
import 'package:caderneta_campo_digital/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:caderneta_campo_digital/components/BasicComponents.dart';
import 'package:caderneta_campo_digital/components/TextBlueButton/main.dart';
import 'package:caderneta_campo_digital/components/UnderlineButton/main.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class TechnicianRegisterPage extends StatefulWidget {
  const TechnicianRegisterPage({Key? key}) : super(key: key);

  @override
  _TechnicianRegisterPageState createState() => _TechnicianRegisterPageState();
}

class _TechnicianRegisterPageState extends State<TechnicianRegisterPage> {
  String? _cpf;
  String? _dataNascimento;
  String? _telefone;
  String? _nome;
  String? _crea;
  String? _formacao;
  String? _email;
  String? _senha;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseAuthentication(
      label: 'CADASTRO',
      isLoading: isLoading,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFieldBC(
              label: "Nome Completo",
              notEmpty: true,
              minLength: 3,
              onSave: (String? value) {
                if (value != null) {
                  _nome = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldDateBC(
              label: "Data de Nascimento",
              notEmpty: true,
              maxYear: DateTime.now().year,
              onSave: (String? value) {
                if (value != null) {
                  _dataNascimento = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldBC(
              label: "CPF",
              keyboardType: TextInputType.number,
              inputFormatters: [Utils().maskCpf],
              validator: (String? value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Campo \"CPF\" deve ser preenchido";
                  }

                  if (!CPFValidator.isValid(value)) {
                    return "CPF é inválido";
                  }
                }
              },
              onSave: (String? value) {
                if (value != null) {
                  _cpf = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldBC(
              label: "Telefone",
              keyboardType: TextInputType.number,
              notEmpty: true,
              minLength: 16,
              inputFormatters: [Utils().maskTelefone],
              onSave: (String? value) {
                if (value != null) {
                  _telefone = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldBC(
              label: "N° do CREA",
              keyboardType: TextInputType.number,
              notEmpty: true,
              minLength: 10,
              inputFormatters: [Utils().maskCrea],
              onSave: (String? value) {
                if (value != null) {
                  _crea = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldBC(
              label: "Formação",
              notEmpty: true,
              onSave: (String? value) {
                if (value != null) {
                  _formacao = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldBC(
              label: "E-mail",
              notEmpty: true,
              format: r'^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?',
              onSave: (String? value) {
                if (value != null) {
                  _email = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldBC(
              label: "Senha",
              notEmpty: true,
              password: true,
              minLength: 8,
              onSave: (String? value) {
                if (value != null) {
                  _senha = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldBC(
              label: "Confirmar Senha",
              password: true,
              validator: (String? value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Campo \"Confirmar Senha\" deve ser preenchido";
                  }

                  if (value != _senha) {
                    return "Senhas não coincidem";
                  }
                }
              },
            ),
            TextBlueButton(
              label: "Cadastrar",
              margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
              onPressed: submit,
            ),
            Center(
              child: UnderlineButton(
                label: "Cancelar",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return LoginPage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submit() async {
    _formKey.currentState!.save();

    if (!_formKey.currentState!.validate()) {
      return null;
    }

    setState(() {
      isLoading = true;
    });

    final response = await DioClient().post('api/tecnico/', {
      'usuario': {
        'cpf': Utils().clearMask(_cpf),
        'dataNascimento': Utils().clearData(_dataNascimento),
        'telefone': Utils().clearMask(_telefone),
        'nome': _nome,
        'senha': _senha,
      },
      'crea': Utils().clearMask(_crea),
      'formacao': _formacao,
      'email': _email,
    });

    setState(() {
      isLoading = false;
    });

    if (response != null) {
      AlertMessenger.alertMessenger
          .messenger(context, 'Cadastro feito com sucesso');
    } else {
      AlertMessenger.alertMessenger
          .messenger(context, 'Ocorreu um erro ao completar o cadastro');
    }
  }
}
