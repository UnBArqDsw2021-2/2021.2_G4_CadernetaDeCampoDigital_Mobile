import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/controllers/add_plantation/add_plantation_controller.dart';
import 'package:caderneta_campo_digital/models/CulturaModel.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/models/TalhaoModel.dart';
import 'package:caderneta_campo_digital/pages/estate/estate_page.dart';
import 'package:flutter/material.dart';
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
  String todayDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String reqDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  AddPlantationController controller = AddPlantationController();
  final _formKey = GlobalKey<FormState>();
  bool missInformation = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.getCulturas();

    return FutureBuilder(
      future: controller.getCulturas(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? Dialog(
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
                              Container(
                                width: size.width * 0.7,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButton<String>(
                                  value: controller.idSelectedCultura,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      controller.idSelectedCultura = newValue!;
                                    });
                                  },
                                  isExpanded: true,
                                  items: controller.culturas
                                      .map<DropdownMenuItem<String>>(
                                    (CulturaModel cultura) {
                                      return DropdownMenuItem<String>(
                                        value: cultura.id,
                                        child: Text(cultura.nome),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.05,
                                  horizontal: size.width * 0.05,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Data Plantio",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Container(
                                          width: size.width * 0.3,
                                          margin: EdgeInsets.only(
                                            top: size.height * 0.01,
                                          ),
                                          child: TextFormField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                              disabledBorder:
                                                  OutlineInputBorder(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Talhão",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Container(
                                          width: size.width * 0.3,
                                          margin: EdgeInsets.only(
                                            top: size.height * 0.01,
                                          ),
                                          child: TextFormField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              fillColor: Colors.white,
                                              filled: true,
                                            ),
                                            initialValue:
                                                widget.talhao.numero.toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              controller.anyProblem
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
              )
            : Loading();
      },
    );
  }

  void buttonPressed() async {
    _formKey.currentState!.save();

    if (_formKey.currentState!.validate()) {
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
