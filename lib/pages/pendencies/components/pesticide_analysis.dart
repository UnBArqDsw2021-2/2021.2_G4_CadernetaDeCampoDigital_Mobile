import 'package:caderneta_campo_digital/controllers/pesticide_analysis/pendency_controller.dart';
import 'package:caderneta_campo_digital/models/PesticideAplicationModel.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class PesticideAnalysisDialog extends StatefulWidget {
  final PesticideAplicationModel pesticide;

  const PesticideAnalysisDialog({Key? key, required this.pesticide})
      : super(key: key);

  @override
  State<PesticideAnalysisDialog> createState() =>
      _PesticideAnalysisDialogState();
}

class _PesticideAnalysisDialogState extends State<PesticideAnalysisDialog> {
  final PendencyController pendencyController = PendencyController();
  final _formKey = GlobalKey<FormState>();
  late String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    BorderRadius border = BorderRadius.circular(15);
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: border,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: ClipRRect(
                  borderRadius: border,
                  child: InkWell(
                    child: Image.network(
                      widget.pesticide.photo,
                      fit: BoxFit.cover,
                      height: size.width * 0.5,
                      width: size.width * 0.85,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.pesticide.produtor,
                  style: Utils.estateTextStyle,
                ),
                Text(
                  widget.pesticide.cultura,
                  style: Utils.estateTextStyle,
                ),
                Text(
                  widget.pesticide.aplicationDate.toString(),
                  style: Utils.estateTextStyle,
                ),
                Text(
                  widget.pesticide.dosage.toString() + " ml",
                  style: Utils.estateTextStyle,
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.only(
                  top: size.height * 0.025,
                ),
                child: TextFormField(
                  key: Key("pesticideIdentification"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Identificação do Agrotóxico',
                  ),
                  validator: (value) =>
                      pendencyController.validateAnalysis(value),
                  controller: pendencyController.analysisTextController,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        errorMessage.isEmpty
            ? Container()
            : Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
        Center(
          child: MaterialButton(
            onPressed: buttonPressed,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              height: size.height * 0.065,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0XFF00B4D8),
              ),
              child: Center(
                child: Text(
                  "Confirmar",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void buttonPressed() async {
    if (_formKey.currentState!.validate()) {
      dynamic response =
          await pendencyController.analysisPressed(widget.pesticide.id);

      if (response)
        Navigator.of(context).pop();
      else
        setState(() {
          errorMessage = "Agrotóxico inválido";
        });
    }
  }
}
