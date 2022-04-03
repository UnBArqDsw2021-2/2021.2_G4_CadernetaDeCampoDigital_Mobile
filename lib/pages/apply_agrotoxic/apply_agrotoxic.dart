import 'dart:io';
import 'package:caderneta_campo_digital/components/basic_components.dart';
import 'package:caderneta_campo_digital/components/display_image_change.dart';
import 'package:caderneta_campo_digital/components/icon_text_button.dart';
import 'package:caderneta_campo_digital/components/info_field.dart';
import 'package:caderneta_campo_digital/components/outlined_text_button.dart';
import 'package:caderneta_campo_digital/components/page_base.dart';
import 'package:caderneta_campo_digital/components/text_blue_button.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/services/agrotoxic/agrotoxic_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ApplyAgrotoxicPage extends StatefulWidget {
  const ApplyAgrotoxicPage({Key? key}) : super(key: key);

  @override
  _ApplyAgrotoxicPageState createState() => _ApplyAgrotoxicPageState();
}

final _formKey = GlobalKey<FormState>();
final TextEditingController _typeAheadController = TextEditingController();

class _ApplyAgrotoxicPageState extends State<ApplyAgrotoxicPage> {
  bool isAgrotoxicNameKnown = true;
  bool isNecessaryToAdd = false;
  String selectedAgrotoxic = '';
  File? image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PageBase(
      title: "Aplicar Agrotóxico",
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height),
              child: IntrinsicHeight(
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
                    InfoField(label: "Plantação", child: "Morango"),
                    InfoField(label: "Data Aplicação", child: "24/02/2022"),
                    InfoField(label: "N° Talhão", child: "10"),
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
                        ? Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                AutocompleteBC(
                                  label: "Nome do Agrotóxico",
                                  suggestionsCallback: searchAgrotoxics,
                                  noItemsFoundBuilder:
                                      "Agrotóxico não encontrado. Preencha os demais campos para adicioná-lo.",
                                  onSuggestionSelected: () => setState(() {
                                    isNecessaryToAdd = false;
                                  }),
                                ),
                                SizedBox(height: 15),
                                isNecessaryToAdd
                                    ? Column(
                                        children: [
                                          AutocompleteBC(
                                            label: "Tipo do Agrotóxico",
                                            suggestionsCallback:
                                                searchAgrotoxicTypes,
                                            noItemsFoundBuilder:
                                                "Tipo de agrotóxico não encotrado. Um novo tipo será criado com o valor informado.",
                                          ),
                                          SizedBox(height: 15),
                                          TextFieldBC(
                                            label: "Período de Carência (dias)",
                                          ),
                                        ],
                                      )
                                    : TextFieldBC(
                                        label: "Período de Carência (dias)",
                                        keyboardType: TextInputType.number,
                                      ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        : image != null
                            ? Center(
                                child: DisplayImageChange(
                                  imageSource: image!,
                                  size:
                                      Size(size.width * 0.8, size.height * 0.3),
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
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          OutlinedTextButton(
                            width: 130.0,
                            label: "Cancelar",
                          ),
                          TextBlueButton(
                            label: "Salvar",
                            width: 130.0,
                          ),
                        ],
                      ),
                    ),
                  ],
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
        isNecessaryToAdd = true;
      });
    }

    return optionsFound;
  }

  Future<List<AgrotoxicType>> searchAgrotoxicTypes(String query) async {
    final agrotoxicTypes = await AgrotoxicService.getAgrotoxicTypes();

    return List.of(agrotoxicTypes).where((type) {
      final typeLower = type.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return typeLower.contains(queryLower);
    }).toList();
  }
}
