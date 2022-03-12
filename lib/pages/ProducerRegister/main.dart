import 'package:caderneta_campo_digital/components/TextBlueButton/main.dart';
import 'package:caderneta_campo_digital/components/UnderlineButton/main.dart';
import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:caderneta_campo_digital/utils/main.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit() async {
    if (!_formKey.currentState!.validate()) {
      return null;
    }
    // print('entrei');

    _formKey.currentState!.save();

    try {
      final response = await DioClient().post('api/produtor/', {
        'usuario': {
          'nome': this._nome,
          'dataNascimento': Utils().clearData(this._dataNascimento),
          'telefone': this._telefone,
          'senha': this._senha,
          'cpf': Utils().clearMask(this._cpf)
        },
        'dap': this._dap!.toUpperCase()
      });
    } catch (error) {
      print(error);
    }
  }

  Widget _buildName() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Nome completo",
        ),
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return "É necessário nome completo";
          }
        },
        onSaved: (String? value) {
          if (value != null) {
            this._nome = value;
          }
        },
      ),
    );
  }

  Widget _buildDataNascimento() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Data de nascimento",
        ),
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return "É necessário a data de nascimento";
          }
        },
        inputFormatters: [Utils().maskData],
        onSaved: (String? value) {
          if (value != null) {
            this._dataNascimento = value;
          }
        },
      ),
    );
  }

  Widget _buildCpf() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "CPF (somente números)",
        ),
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return "É necessário CPF";
          }

          if (!CPFValidator.isValid(value)) {
            return "CPF é inválido";
          }
        },
        inputFormatters: [Utils().maskCpf],
        onSaved: (String? value) {
          if (value != null) {
            this._cpf = value;
          }
        },
      ),
    );
  }

  Widget _buildTelefone() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Telefone",
        ),
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return "É necessário telefone";
          }
        },
        inputFormatters: [Utils().maskTelefone],
        onSaved: (String? value) {
          if (value != null) {
            this._telefone = value;
          }
        },
      ),
    );
  }

  Widget _buildDap() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "DAP",
        ),
        validator: (String? value) {
          if (value != null) {
            if (value.isEmpty) {
              return "É necessário DAP";
            } else {
              RegExp regexp = new RegExp(r'[a-zA-Z]{3}\d{22}');
              bool itMatches = regexp.hasMatch(value);

              if (!itMatches) {
                return "DAP está com formato incorreto";
              }
            }
          }
        },
        onSaved: (String? value) {
          if (value != null) {
            this._dap = value;
          }
        },
      ),
    );
  }

  Widget _buildSenha() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Senha",
        ),
        validator: (String? value) {
          if (value != null) {
            if (value.isEmpty) {
              return "Senha é necessária";
            } else {
              if (value.length < 8) {
                return "Senha deve possuir no mínimo 8 caracteres";
              }
            }
          }
        },
        onChanged: (value) {
          if (value != '') {
            this._senha = value;
          }
        },
      ),
    );
  }

  Widget _buildConfirmarSenha() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Confirme sua senha",
        ),
        validator: (String? value) {
          if (value != null) {
            if (value.isEmpty) {
              return "É necessário confirmar a senha";
            } else {
              if (this._senha != value) {
                return "Senhas não coincidem";
              }
            }
          }
        },
        onSaved: (String? value) {
          if (value != null) {
            this._senha = value;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      'assets/white_stack_background_upper.svg',
                      width: size.width,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    // padding: EdgeInsets.only(top: size.height * 0.615),
                    child: SvgPicture.asset(
                      'assets/white_stack_background_lower.svg',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: 90),
                        child: Text(
                          "CADASTRO",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: SvgPicture.asset('assets/logo.svg'),
                      ),
                      _buildName(),
                      _buildDataNascimento(),
                      _buildCpf(),
                      _buildTelefone(),
                      _buildDap(),
                      _buildSenha(),
                      _buildConfirmarSenha(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            TextBlueButton(
                              label: "Cadastrar",
                              onPressed: submit,
                              margin: EdgeInsets.symmetric(vertical: 10),
                            ),
                            UnderlineButton(
                              label: "Cancelar",
                              onPressed: () {
                                print('Cancelei');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
