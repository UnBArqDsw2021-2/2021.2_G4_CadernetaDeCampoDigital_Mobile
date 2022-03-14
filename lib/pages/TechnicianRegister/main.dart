import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/components/BasicComponents.dart';
import 'package:caderneta_campo_digital/components/TextBlueButton/main.dart';
import 'package:caderneta_campo_digital/components/UnderlineButton/main.dart';
import 'package:caderneta_campo_digital/utils/main.dart';
import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dio/dio.dart';

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
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    _formKey.currentState!.save();
    if (!_formKey.currentState!.validate()) {
      return null;
    }

    final dataDividida = this._dataNascimento!.split('/');

    try {
      final response = await DioClient().post('api/tecnico/', {
        'usuario': {
          'cpf': this._cpf!.replaceAll(new RegExp(r'[\s\.\-]+'), ''),
          'dataNascimento':
              '${dataDividida[2]}-${dataDividida[1]}-${dataDividida[0]}',
          'telefone':
              this._telefone!.replaceAll(new RegExp(r'[\s\.\-\(\)]+'), ''),
          'nome': this._nome,
          'senha': this._senha,
        },
        'crea': this._crea!.replaceAll(new RegExp(r'[\s\.\-]+'), ''),
        'formacao': this._formacao,
        'email': this._email,
      });

      print(response);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Stack(children: [
        SvgPicture.asset("assets/white_stack_background_upper.svg",
            width: size.width),
        Center(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 90),
                child: Text("CADASTRO",
                    style: TextStyle(
                        fontSize: 36,
                        color: MyColors().white,
                        fontFamily: 'Roboto')))),
      ]),
      SvgPicture.asset("assets/logo.svg"),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFieldBC(
                  label: "CPF",
                  keyboardType: TextInputType.number,
                  inputFormatters: [Utils().maskCpf],
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return "Campo \"CPF\" deve ser preenchido";
                    }

                    if (!CPFValidator.isValid(value)) {
                      return "CPF é inválido";
                    }
                  },
                  onSave: (String? value) {
                    if (value != null) {
                      this._cpf = value;
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
                  label: "Telefone",
                  keyboardType: TextInputType.number,
                  notEmpty: true,
                  minLength: 11,
                  inputFormatters: [Utils().maskTelefone],
                  onSave: (String? value) {
                    if (value != null) {
                      this._telefone = value;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFieldBC(
                  label: "Nome",
                  notEmpty: true,
                  minLength: 3,
                  onSave: (String? value) {
                    if (value != null) {
                      this._nome = value;
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
                      this._crea = value;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFieldBC(
                  label: "Formação",
                  notEmpty: true,
                  onSave: (String? value) {
                    if (value != null) {
                      this._formacao = value;
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
                      this._email = value;
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
                    if (value != null && value.isEmpty) {
                      return "Campo \"Confirmar Senha\" deve ser preenchido";
                    }

                    if (value != null && value != _senha) {
                      return "Senhas não coincidem";
                    }
                  },
                ),
                TextBlueButton(
                  label: "Cadastrar",
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 20),
                  onPressed: submit,
                ),
              ],
            ),
          )),
      Stack(children: [
        Center(child: UnderlineButton(label: "Cancelar")),
        Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset("assets/white_stack_background_lower.svg"))
      ])
    ])));
  }
}
