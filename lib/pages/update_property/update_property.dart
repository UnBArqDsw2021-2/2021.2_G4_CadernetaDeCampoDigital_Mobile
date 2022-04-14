import 'package:caderneta_campo_digital/components/alert_messenger.dart';
import 'package:caderneta_campo_digital/components/basic_components.dart';
import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/components/text_blue_button.dart';
import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/controllers/update_property/update_property_controller.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class UpdatePropertyPage extends StatefulWidget {
  final Propriedade estate;
  const UpdatePropertyPage({Key? key, required this.estate}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UpdatePropertyState();
}

class _UpdatePropertyState extends State<UpdatePropertyPage> {
  bool isLoading = false;
  String? _cep;
  String? _street;
  String? _city;
  String? _uf;
  String? _houseNumber;
  String? _address;
  String? _hectares;
  String? _complement;

  UpdatePropertyController updatePropertyController =
      UpdatePropertyController();

  final GlobalKey<FormState> _formPropertyKey = GlobalKey<FormState>();

  void submit() async {
    _formPropertyKey.currentState!.save();

    if (!_formPropertyKey.currentState!.validate()) {
      return null;
    }

    setState(() {
      isLoading = true;
    });

    dynamic response = await updatePropertyController.sendForm({
      'id': widget.estate.id,
      'cep': Utils().clearMask(_cep),
      'bairro': _street,
      'estado': _uf,
      'cidade': _city,
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
          .successMessenger(context, 'Propriedade editada com sucesso!');
      Navigator.pop(context);
    } else {
      AlertMessenger.alertMessenger
          .errorMessenger(context, 'Ocorreu um erro ao editar a propriedade');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        topbarHeight: (size * 0.10),
        title: "Editar propriedade",
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
                      initialValue: Utils().maskCep.maskText(widget.estate.cep),
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
                            initialValue: widget.estate.cidade,
                            label: "Cidade",
                            notEmpty: true,
                            keyboardType: TextInputType.text,
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
                            padding: EdgeInsets.only(left: 5),
                            child: DropdownButtonFormField(
                              hint: Text('Estado'),
                              value: widget.estate.estado,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                isDense: true,
                              ),
                              items: Utils().getUFsList(),
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
                            initialValue: widget.estate.bairro,
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
                            padding: EdgeInsets.only(left: 5),
                            child: TextFieldBC(
                              initialValue: widget.estate.numeroCasa.toString(),
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
                      initialValue: widget.estate.logradouro,
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
                      initialValue:
                          Utils().maskHectares.maskText(widget.estate.hectares),
                      label: "Hectares",
                      notEmpty: true,
                      minLength: 1,
                      maxLength: 6,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [Utils().maskHectares],
                      onSave: (String? value) {
                        if (value != null) {
                          _hectares = value;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFieldBC(
                      initialValue: widget.estate.complemento,
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
