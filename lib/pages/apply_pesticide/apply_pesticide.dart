import 'dart:convert';
import 'dart:io';
import 'package:caderneta_campo_digital/components/alert_messenger.dart';
import 'package:caderneta_campo_digital/components/basic_components.dart';
import 'package:caderneta_campo_digital/components/display_image_change.dart';
import 'package:caderneta_campo_digital/components/icon_text_button.dart';
import 'package:caderneta_campo_digital/components/info_field.dart';
import 'package:caderneta_campo_digital/components/page_base.dart';
import 'package:caderneta_campo_digital/components/text_blue_button.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/models/PesticideModel.dart';
import 'package:caderneta_campo_digital/services/pesticide/pesticide_service.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/pesticide/pesticide_controller.dart';

class ApplyPesticidePage extends StatefulWidget {
  final String plantationName;
  final String plantationID;
  final int tilesNumber;

  const ApplyPesticidePage({
    Key? key,
    required this.plantationName,
    required this.plantationID,
    required this.tilesNumber,
  }) : super(key: key);

  @override
  _ApplyPesticidePageState createState() => _ApplyPesticidePageState();
}

class _ApplyPesticidePageState extends State<ApplyPesticidePage> {
  bool isPesticideNameKnown = true;
  bool isNecessaryToAddPesticide = false;
  bool isNecessaryToAddType = false;
  String selectedPesticide = '';
  File? image;
  String imageError = '';
  bool isLoading = false;
  PesticideController pesticideController = PesticideController();
  String? _applicationDate;
  String? _quantity;
  String? _name;
  String? _type;
  // ignore: unused_field
  String? _period; //Será usado no futuro
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PageBase(
      title: "Aplicar Agrotóxico",
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "INFORMAÇÕES DA PLANTAÇÃO",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
                height: 5,
              ),
              SizedBox(height: 15),
              InfoField(
                label: "Plantação",
                child: widget.plantationName,
              ),
              InfoField(
                label: "N° Talhão",
                child: widget.tilesNumber.toString(),
              ),
              SizedBox(height: 20),
              Text(
                "IDENTIFICAÇÃO DO AGROTÓXICO",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
                height: 5,
              ),
              SizedBox(height: 15),
              TextFieldDateBC(
                label: "Data de Aplicação *",
                notEmpty: true,
                maxYear: DateTime.now().year,
                onSave: (String? value) {
                  if (value != null) {
                    _applicationDate = value;
                  }
                },
              ),
              SizedBox(height: 15),
              TextFieldBC(
                label: "Dosagem Aplicada (Litros)",
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Campo \"Dosagem Aplicada\" deve ser preenchido";
                    }

                    if (double.parse(value) <= 0) {
                      return "Dosagem deve ser maior que zero litros.";
                    }

                    if (double.parse(value) >= 10) {
                      return "Dosagem deve ser menor que dez litros.";
                    }

                    if (value.length > 4) {
                      return "Dosagem deve ter até duas casas decimais.";
                    }
                  }

                  return null;
                },
                onSave: (String? value) {
                  if (value != null) {
                    _quantity = value;
                  }
                },
              ),
              SizedBox(height: 15),
              Text(
                "Você Sabe o Nome do Agrotóxico?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isPesticideNameKnown,
                    onChanged: (bool? value) {
                      setState(() {
                        isPesticideNameKnown = value!;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text("Sim"),
                  ),
                  Radio<bool>(
                    value: false,
                    groupValue: isPesticideNameKnown,
                    onChanged: (bool? value) {
                      setState(() {
                        isPesticideNameKnown = value!;
                      });
                    },
                  ),
                  Text("Não"),
                ],
              ),
              isPesticideNameKnown
                  ? Column(
                      children: [
                        AutocompleteBC(
                          label: "Nome do Agrotóxico *",
                          notEmpty: true,
                          suggestionsCallback: searchPesticides,
                          noItemsFoundBuilder:
                              "Agrotóxico não encontrado. Preencha os demais campos para adicioná-lo.",
                          onSuggestionSelected: () => setState(() {
                            isNecessaryToAddPesticide = false;
                          }),
                          onSave: (String? value) {
                            if (value != null) {
                              _name = value;
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        if (isNecessaryToAddPesticide)
                          Column(
                            children: [
                              AutocompleteBC(
                                label: "Tipo do Agrotóxico *",
                                notEmpty: true,
                                suggestionsCallback: searchPesticideTypes,
                                onSuggestionSelected: () => setState(() {
                                  isNecessaryToAddType = false;
                                }),
                                noItemsFoundBuilder:
                                    "Tipo de agrotóxico não encotrado. Um novo tipo será criado com o valor informado.",
                                onSave: (String? value) {
                                  if (value != null) {
                                    _type = value;
                                  }
                                },
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        TextFieldBC(
                          label: "Período de Carência (dias) *",
                          keyboardType: TextInputType.number,
                          notEmpty: true,
                          onSave: (String? value) {
                            if (value != null) {
                              _period = value;
                            }
                          },
                        ),
                      ],
                    )
                  : image != null
                      ? Center(
                          child: DisplayImageChange(
                            imageSource: image!,
                            size: Size(
                              size.width * 0.8,
                              size.height * 0.3,
                            ),
                            iconColor: MyColors().white,
                            backgroundColor: MyColors().blue,
                            onClicked: (source) => pickImage(source),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              "Selecionar Foto do Agrotóxico:",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  IconTextButton(
                                    "Buscar na Galeria",
                                    Size(size.height, size.width * 2),
                                    Icon(
                                      Icons.photo_library_outlined,
                                      color: MyColors().white,
                                    ),
                                    0.02,
                                    splashColor: Colors.transparent,
                                    borderColor: MyColors().blue,
                                    backgroundColor: MyColors().blue,
                                    textColor: MyColors().white,
                                    fontSize: 18,
                                    onPressed: () {
                                      pickImage(ImageSource.gallery);
                                    },
                                  ),
                                  IconTextButton(
                                    "Usar a Câmera",
                                    Size(size.height, size.width * 2),
                                    Icon(
                                      Icons.add_a_photo_outlined,
                                      color: MyColors().white,
                                    ),
                                    0.02,
                                    borderColor: MyColors().blue,
                                    backgroundColor: MyColors().blue,
                                    textColor: MyColors().white,
                                    fontSize: 18,
                                    onPressed: () {
                                      pickImage(ImageSource.camera);
                                    },
                                  ),
                                  Text(
                                    imageError,
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: TextBlueButton(
                  label: isPesticideNameKnown ? "Salvar" : "Enviar",
                  onPressed: isPesticideNameKnown ? submit : send,
                  width: 130.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final imageResponse = await ImagePicker().pickImage(source: source);
      if (imageResponse == null) return;

      final imageTemporary = File(imageResponse.path);
      setState(() => image = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint("Falha ao selecionar a imagem $e");
    }
  }

  Future<List<Pesticide>> searchPesticides(String query) async {
    final pesticides = await PesticideService.getPesticides();

    final optionsFound = List.of(pesticides).where((pesticide) {
      final pesticideLower = pesticide.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return pesticideLower.contains(queryLower);
    }).toList();

    if (optionsFound.isEmpty) {
      setState(() {
        isNecessaryToAddPesticide = true;
      });
    }

    return optionsFound;
  }

  void informResult(dynamic response) {
    if (response != null) {
      Navigator.pop(context);
      AlertMessenger.alertMessenger.successMessenger(
        context,
        'Aplicação de agrotóxico registrada com sucesso',
      );
    } else {
      AlertMessenger.alertMessenger.errorMessenger(
        context,
        'Ocorreu um erro ao completar a aplicação de agrotóxico',
      );
    }
  }

  Future<List<PesticideType>> searchPesticideTypes(String query) async {
    final pesticideTypes = await PesticideService.getPesticideTypes();

    final optionsFound = List.of(pesticideTypes).where((type) {
      final typeLower = type.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return typeLower.contains(queryLower);
    }).toList();

    if (optionsFound.isEmpty) {
      setState(() {
        isNecessaryToAddType = true;
      });
    }

    return optionsFound;
  }

  Future<Pesticide> findPesticide() async {
    final results = await searchPesticides(_name!);

    final pesticides = results.where((el) {
      final nameLower = el.name.toLowerCase();
      final queryLower = _name!.toLowerCase();

      return nameLower == queryLower;
    }).toList();

    return pesticides.first;
  }

  Future<PesticideType> findPesticideType() async {
    final results = await searchPesticideTypes(_type!);

    final types = results.where((el) {
      final typeLower = el.name.toLowerCase();
      final queryLower = _type!.toLowerCase();

      return typeLower == queryLower;
    }).toList();

    return types.first;
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
    String pesticideID = '';
    String typeID = '';

    if (isNecessaryToAddType) {
      response = await pesticideController.sendPesticideTypeForm({
        'nome': _type,
      });

      Map<String, dynamic> responseObj = jsonDecode(response.toString());
      typeID = responseObj["idTipoAgrotoxico"];
    } else if (isNecessaryToAddPesticide) {
      if (typeID == '') {
        final type = await findPesticideType();
        typeID = type.id;
      }

      response = await pesticideController.sendPesticideForm({
        'nome': _name,
        'tipo': typeID,
      });

      Map<String, dynamic> responseObj = jsonDecode(response.toString());

      pesticideID = responseObj["idAgrotoxico"];
    } else {
      if (pesticideID == '') {
        final pesticide = await findPesticide();
        pesticideID = pesticide.id;
      }

      response = await pesticideController.sendPesticideApplicationForm({
        'plantio': widget.plantationID,
        'agrotoxico': pesticideID,
        'dataAplicacao': Utils().clearData(_applicationDate),
        'dosagemAplicacao': double.parse(_quantity!),
      });

      debugPrint(response.toString());
    }

    setState(() {
      isLoading = false;
    });

    informResult(response);
  }

  void send() async {
    _formKey.currentState!.save();

    if (!_formKey.currentState!.validate()) {
      return null;
    }

    if (image == null) {
      setState(() {
        imageError = "Foto do agrotóxico é obrigatória";
      });

      return null;
    }

    setState(() {
      isLoading = true;
    });

    String fileName = image!.path.split('/').last;

    Map<String, MultipartFile> fileMap = {
      'fotoAgrotoxico': MultipartFile(
        image!.openRead(),
        await image!.length(),
        filename: fileName,
      ),
    };

    dynamic response =
        await pesticideController.sendPesticideApplicationPhotoForm(
      {
        'plantio': widget.plantationID,
        'dataAplicacao': Utils().clearData(_applicationDate),
        'dosagemAplicacao': double.parse(_quantity!),
      },
      fileMap,
    );

    setState(() {
      isLoading = false;
    });

    informResult(response);
  }
}
