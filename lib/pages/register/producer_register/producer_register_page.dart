import 'package:caderneta_campo_digital/components/base_authentication.dart';
import 'package:caderneta_campo_digital/components/text_blue_button.dart';
import 'package:caderneta_campo_digital/components/underline_button.dart';
import 'package:caderneta_campo_digital/components/alert_messenger.dart';
import 'package:caderneta_campo_digital/controllers/register/register_controller.dart';
import 'package:caderneta_campo_digital/pages/login/login_page.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import '../../../components/basic_components.dart';

class ProducerRegisterPage extends StatefulWidget {
  const ProducerRegisterPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ProducerRegisterState();
}

class _ProducerRegisterState extends State<ProducerRegisterPage> {
  String? _nome;
  String? _dataNascimento;
  String? _cpf;
  String? _telefone;
  String? _senha;
  String? _dap;
  bool isLoading = false;
  RegisterController registerController = RegisterController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseAuthentication(
      label: "CADASTRO",
      isLoading: isLoading,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              label: "DAP",
              notEmpty: true,
              minLength: 25,
              maxLength: 25,
              validator: (String? value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Campo \"DAP\" deve ser preenchido";
                  } else {
                    RegExp regexp = RegExp(r'[a-zA-Z]{3}\d{22}');
                    bool itMatches = regexp.hasMatch(value);

                    if (!itMatches) {
                      return "DAP está com formato incorreto";
                    }
                  }
                }
              },
              onSave: (String? value) {
                if (value != null) {
                  _dap = value;
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
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

    dynamic response;

    response = await registerController.sendForm('Producer', {
      'nome': _nome,
      'dataNascimento': Utils().clearData(_dataNascimento),
      'telefone': Utils().clearMask(_telefone),
      'senha': _senha,
      'cpf': Utils().clearMask(_cpf),
      'dap': _dap!.toUpperCase(),
    });

    setState(() {
      isLoading = false;
    });

    if (response != null) {
      AlertMessenger.alertMessenger
          .successMessenger(context, 'Cadastro feito com sucesso');
    } else {
      AlertMessenger.alertMessenger
          .errorMessenger(context, 'Ocorreu um erro ao completar o cadastro');
    }
  }
}
