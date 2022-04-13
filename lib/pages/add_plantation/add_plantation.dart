import 'dart:io';

import 'package:caderneta_campo_digital/controllers/add_plantation/add_plantation_controller.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/models/TalhaoModel.dart';
import 'package:caderneta_campo_digital/pages/estate/estate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddPlantationDialog extends StatefulWidget {
  final TalhaoModel talhao;
  final Propriedade estate;

  const AddPlantationDialog({
    Key? key,
    required this.talhao,
    required this.estate,
  }) : super(key: key);

  @override
  State<AddPlantationDialog> createState() => _AddPlantationDialogState();
}

class _AddPlantationDialogState extends State<AddPlantationDialog> {
  File? image;
  var imageWidget;
  String todayDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String reqDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  AddPlantationController controller = AddPlantationController();
  final _formKey = GlobalKey<FormState>();
  bool missInformation = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.05),
            color: Color(0XFF00B4D8),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Adicionar plantação",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.7,
                      height: 2,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 20),
                    ),
                    imageWidget != null
                        ? Container(
                            width: size.width * 0.25,
                            height: size.width * 0.25,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              image: DecorationImage(
                                image: imageWidget as ImageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : MaterialButton(
                            onPressed: () async {
                              final source = await showImageSource(context);
                              if (source != null) await pickImage(source);
                            },
                            child: Container(
                              width: size.width * 0.25,
                              height: size.width * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Color(0XFF00B4D8),
                                size: size.width * 0.1,
                              ),
                            ),
                          ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.05,
                          bottom: size.height * 0.01,
                          left: size.width * 0.05,
                        ),
                        child: Text(
                          "Plantação",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        // ignore: no-empty-block
                        onChanged: (_) => setState(() {}),
                        controller: controller.plantationNameController,
                        validator: (value) =>
                            controller.validatePlantationName(value),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.05,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Data Plantio",
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                width: size.width * 0.3,
                                margin:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  readOnly: true,
                                  initialValue: todayDate,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Talhão",
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                width: size.width * 0.3,
                                margin:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  initialValue: widget.talhao.numero.toString(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    controller.anyProblem
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                size: 14,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  controller.errorText,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 20),
                      child: MaterialButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          buttonPressed();
                        },
                        splashColor: Colors.white,
                        child: Container(
                          width: size.width * 0.35,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Confirmar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.loadingRequest
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : Container(),
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
      setState(() {
        image = imageTemporary;
        imageWidget = image!.path.contains("https://")
            ? NetworkImage(image!.path)
            : FileImage(File(image!.path));
      });
    } on PlatformException catch (e) {
      debugPrint("Falha ao selecionar a imagem $e");
    }
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.add_a_photo_outlined),
            title: Text('Camera'),
            onTap: () => Navigator.of(context).pop(ImageSource.camera),
          ),
          ListTile(
            leading: Icon(
              Icons.photo_library_outlined,
            ),
            title: Text('Galeria'),
            onTap: () => Navigator.of(context).pop(ImageSource.gallery),
          ),
        ],
      ),
    );
  }

  void buttonPressed() async {
    _formKey.currentState!.save();

    if (_formKey.currentState!.validate()) {
      if (image == null)
        setState(() {
          controller.anyProblem = true;
          controller.errorText = "Adicione uma imagem";
        });
      else {
        setState(() {
          controller.loadingRequest = true;
        });
        bool reqOk = await controller.sendNewPlantationRequest(
          controller.plantationNameController.text,
          widget.talhao,
          reqDate,
        );
        if (reqOk) {
          controller.loadingRequest = false;
          Propriedade newEstate = await controller.updateEstateInfo(
            widget.estate,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EstatePage(
                estate: newEstate,
                isProductorTheViewer: true,
              ),
            ),
          );
        } else
          setState(() {
            controller.loadingRequest = false;
          });
      }
    }
  }
}
