import 'package:caderneta_campo_digital/components/TextBlueButton/main.dart';
import 'package:caderneta_campo_digital/components/UnderlineButton/main.dart';
import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:caderneta_campo_digital/utils/main.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/BasicComponents.dart';
import '../../global/colors.dart';

class ProducerRegisterPage extends StatefulWidget {
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit() async {
    setState(() {
      isLoading = true;
    });

    _formKey.currentState!.save();

    if (!_formKey.currentState!.validate()) {
      return null;
    }

    final response = await DioClient().post('api/produtor/', {
      'usuario': {
        'nome': this._nome,
        'dataNascimento': Utils().clearData(this._dataNascimento),
        'telefone': Utils().clearMask(this._telefone),
        'senha': this._senha,
        'cpf': Utils().clearMask(this._cpf)
      },
      'dap': this._dap!.toUpperCase()
    });

    setState(() {
      isLoading = false;
    });

    if (response != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Cadastro feito com sucesso',
          style: TextStyle(
              fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.greenAccent,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Ocorreu um erro ao completar o cadastro',
          style: TextStyle(
              fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/white_stack_background_upper.svg",
                  width: size.width,
                ),
                isLoading
                    ? Container()
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 90),
                          child: Text(
                            "CADASTRO",
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
            isLoading
                ? (Container(height: size.height * 0.65, child: Loading()))
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: SvgPicture.asset("assets/logo.svg"),
                          ),
                          TextFieldBC(
                            label: "Nome Completo",
                            notEmpty: true,
                            minLength: 3,
                            onSave: (String? value) {
                              if (value != null) {
                                this._nome = value;
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
                                this._dataNascimento = value;
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
                                this._cpf = value;
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
                                this._telefone = value;
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
                                  RegExp regexp =
                                      new RegExp(r'[a-zA-Z]{3}\d{22}');
                                  bool itMatches = regexp.hasMatch(value);

                                  if (!itMatches) {
                                    return "DAP está com formato incorreto";
                                  }
                                }
                              }
                            },
                            onSave: (String? value) {
                              if (value != null) {
                                this._dap = value;
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          TextFieldBC(
                            label: "Senha",
                            notEmpty: true,
                            obscureText: true,
                            minLength: 8,
                            onSave: (String? value) {
                              if (value != null) {
                                this._senha = value;
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          TextFieldBC(
                            label: "Confirmar Senha",
                            obscureText: true,
                            validator: (String? value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return "Campo \"Confirmar Senha\" deve ser preenchido";
                                }

                                if (value != this._senha) {
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
                                      print('Cancelei');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            Align(
              alignment: Alignment.bottomLeft,
              child:
                  SvgPicture.asset("assets/white_stack_background_lower.svg"),
            ),
            // Stack(
            //   children: [

            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
