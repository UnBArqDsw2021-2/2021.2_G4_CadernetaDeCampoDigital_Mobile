import 'dart:ffi';

import 'package:caderneta_campo_digital/components/alert_messenger.dart';
import 'package:caderneta_campo_digital/components/basic_components.dart';
import 'package:caderneta_campo_digital/components/text_blue_button.dart';
import 'package:caderneta_campo_digital/components/topbar.dart';
import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/controllers/add_property/add_property_controller.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddPropertyPage> {
  bool isLoading = false;
  String? _cep;
  String? _city;
  String? _uf;
  String? _street;
  String? _houseNumber;
  String? _address;
  String? _hectares;
  String? _complement;

  AddPropertyController addPropertyController = AddPropertyController();

  final GlobalKey<FormState> _formPropertyKey = GlobalKey<FormState>();

  void submit() async {
    _formPropertyKey.currentState!.save();

    if (!_formPropertyKey.currentState!.validate()) {
      return null;
    }

    setState(() {
      isLoading = true;
    });

    dynamic response = await addPropertyController.sendForm({
      'cep': Utils().clearMask(_cep),
      'estado': _uf,
      'cidade': _city,
      'bairro': _street,
      'complemento': _complement,
      'numeroCasa': _houseNumber,
      'hectares': _hectares,
      'logradouro': _address,
    });

    setState(() {
      isLoading = false;
    });

    if (response != null) {
      AlertMessenger.alertMessenger
          .successMessenger(context, 'Propriedade criada com sucesso!');
    } else {
      AlertMessenger.alertMessenger
          .errorMessenger(context, 'Ocorreu um erro ao criar o propriedade');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        topbarHeight: (size * 0.10),
        title: "Adicionar propriedade",
        hasActions: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formPropertyKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextFieldBC(
                label: "CEP",
                notEmpty: true,
                minLength: 3,
                keyboardType: TextInputType.number,
                inputFormatters: [Utils().maskCep],
                onSave: (String? value) {
                  if (value != null) {
                    _cep = value;
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: TextFieldBC(
                      label: "Cidade",
                      notEmpty: true,
                      keyboardType: TextInputType.number,
                      onSave: (String? value) {
                        if (value != null) {
                          _city = value;
                        }
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: DropdownButtonFormField(
                        hint: Text('Estado'),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        items: addPropertyController.getUFsList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _uf = newValue;
                          });
                        },
                      ),
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
                      label: "Bairro",
                      notEmpty: true,
                      minLength: 1,
                      onSave: (String? value) {
                        if (value != null) {
                          _street = value;
                        }
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: TextFieldBC(
                        label: "Casa",
                        notEmpty: true,
                        minLength: 1,
                        keyboardType: TextInputType.number,
                        onSave: (String? value) {
                          if (value != null) {
                            _houseNumber = value;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFieldBC(
                label: "Logradouro",
                notEmpty: true,
                minLength: 1,
                onSave: (String? value) {
                  if (value != null) {
                    _address = value;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFieldBC(
                label: "Hectares",
                notEmpty: true,
                minLength: 1,
                maxLength: 6,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [Utils().maskHectares],
                onSave: (String? value) {
                  if (value != null) {
                    _hectares = value;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFieldBC(
                label: "Complemento",
                notEmpty: true,
                minLength: 1,
                onSave: (String? value) {
                  if (value != null) {
                    _complement = value;
                  }
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 80),
                child: TextBlueButton(
                  label: 'Adicionar',
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
