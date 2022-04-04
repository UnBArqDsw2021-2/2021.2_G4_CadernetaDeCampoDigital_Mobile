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
import 'package:caderneta_campo_digital/models/models.dart';
import 'package:caderneta_campo_digital/services/agrotoxic/agrotoxic_service.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/agrotoxic/agrotoxic_controller.dart';

class ApplyAgrotoxicPage extends StatefulWidget {
  final String plantationName;
  final String plantationID;
  final int tilesNumber;

  const ApplyAgrotoxicPage({
    Key? key,
    required this.plantationName,
    required this.plantationID,
    required this.tilesNumber,
  }) : super(key: key);

  @override
  _ApplyAgrotoxicPageState createState() => _ApplyAgrotoxicPageState();
}

class _ApplyAgrotoxicPageState extends State<ApplyAgrotoxicPage> {
  bool isAgrotoxicNameKnown = true;
  bool isNecessaryToAddAgrotoxic = false;
  bool isNecessaryToAddType = false;
  String selectedAgrotoxic = '';
  File? image;
  bool isLoading = false;
  AgrotoxicController agrotoxicController = AgrotoxicController();
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
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height * 0.75),
              child: IntrinsicHeight(
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
                            groupValue: isAgrotoxicNameKnown,
                            onChanged: (bool? value) {
                              setState(() {
                                isAgrotoxicNameKnown = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text("Sim"),
                          ),
                          Radio<bool>(
                            value: false,
                            groupValue: isAgrotoxicNameKnown,
                            onChanged: (bool? value) {
                              setState(() {
                                isAgrotoxicNameKnown = value!;
                              });
                            },
                          ),
                          Text("Não"),
                        ],
                      ),
                      isAgrotoxicNameKnown
                          ? Column(
                              children: [
                                AutocompleteBC(
                                  label: "Nome do Agrotóxico *",
                                  notEmpty: true,
                                  suggestionsCallback: searchAgrotoxics,
                                  noItemsFoundBuilder:
                                      "Agrotóxico não encontrado. Preencha os demais campos para adicioná-lo.",
                                  onSuggestionSelected: () => setState(() {
                                    isNecessaryToAddAgrotoxic = false;
                                  }),
                                  onSave: (String? value) {
                                    if (value != null) {
                                      _name = value;
                                    }
                                  },
                                ),
                                SizedBox(height: 15),
                                if (isNecessaryToAddAgrotoxic)
                                  Column(
                                    children: [
                                      AutocompleteBC(
                                        label: "Tipo do Agrotóxico *",
                                        notEmpty: true,
                                        suggestionsCallback:
                                            searchAgrotoxicTypes,
                                        onSuggestionSelected: () =>
                                            setState(() {
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
                                    backgroundColor: MyColors().blueButton,
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
                                            borderColor: MyColors().blueButton,
                                            backgroundColor:
                                                MyColors().blueButton,
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
                                            borderColor: MyColors().blueButton,
                                            backgroundColor:
                                                MyColors().blueButton,
                                            textColor: MyColors().white,
                                            fontSize: 18,
                                            onPressed: () {
                                              pickImage(ImageSource.camera);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Center(
                          child: TextBlueButton(
                            label: isAgrotoxicNameKnown ? "Salvar" : "Enviar",
                            onPressed: isAgrotoxicNameKnown ? submit : send,
                            width: 130.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
      debugPrint("Failed to pick image $e");
    }
  }

  Future<List<Agrotoxic>> searchAgrotoxics(String query) async {
    final agrotoxics = await AgrotoxicService.getAgrotoxics();
    final optionsFound = List.of(agrotoxics).where((agrotoxic) {
      final agrotoxicLower = agrotoxic.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return agrotoxicLower.contains(queryLower);
    }).toList();

    if (optionsFound.isEmpty) {
      setState(() {
        isNecessaryToAddAgrotoxic = true;
      });
    }

    return optionsFound;
  }

  Future<List<AgrotoxicType>> searchAgrotoxicTypes(String query) async {
    final agrotoxicTypes = await AgrotoxicService.getAgrotoxicTypes();

    final optionsFound = List.of(agrotoxicTypes).where((type) {
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

  Future<Agrotoxic> findAgrotoxic() async {
    final results = await searchAgrotoxics(_name!);

    final agrotoxics = results.where((el) {
      final nameLower = el.name.toLowerCase();
      final queryLower = _name!.toLowerCase();

      return nameLower == queryLower;
    }).toList();

    return agrotoxics.first;
  }

  Future<AgrotoxicType> findAgrotoxicType() async {
    final results = await searchAgrotoxicTypes(_type!);

    final types = results.where((el) {
      final typeLower = el.name.toLowerCase();
      final queryLower = _type!.toLowerCase();

      return typeLower == queryLower;
    }).toList();

    return types.first;
  }

  // ignore: long-method
  void submit() async {
    _formKey.currentState!.save();

    if (!_formKey.currentState!.validate()) {
      return null;
    }

    setState(() {
      isLoading = true;
    });

    dynamic response;
    String agrotoxicID = '';
    String typeID = '';

    if (isNecessaryToAddType) {
      response = await agrotoxicController.sendAgrotoxicTypeForm({
        'nome': _type,
      });

      Map<String, dynamic> responseObj = jsonDecode(response.toString());
      typeID = responseObj["idTipoAgrotoxico"];
    } else if (isNecessaryToAddAgrotoxic) {
      if (typeID == '') {
        final type = await findAgrotoxicType();
        typeID = type.id;
      }

      response = await agrotoxicController.sendAgrotoxicForm({
        'nome': _name,
        'tipo': typeID,
      });

      Map<String, dynamic> responseObj = jsonDecode(response.toString());

      agrotoxicID = responseObj["idAgrotoxico"];
    } else {
      if (agrotoxicID == '') {
        final agrotoxic = await findAgrotoxic();
        agrotoxicID = agrotoxic.id;
      }

      response = await agrotoxicController.sendAgrotoxicApplicationForm({
        'plantio': widget.plantationID,
        'agrotoxico': agrotoxicID,
        'dataAplicacao': Utils().clearData(_applicationDate),
        'dosagemAplicacao': double.parse(_quantity!),
      });

      debugPrint(response.toString());
    }

    setState(() {
      isLoading = false;
    });

    if (response != null) {
      AlertMessenger.alertMessenger.successMessenger(
        context,
        'Aplicação de agrotóxico registrada com sucesso',
      );
      Navigator.pop(context);
    } else {
      AlertMessenger.alertMessenger.errorMessenger(
        context,
        'Ocorreu um erro ao completar a aplicação de agrotóxico',
      );
    }
  }

  void send() async {
    debugPrint("AINDA SERÁ IMPLEMENTADO NO BACKEND");
  }
}
