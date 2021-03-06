import 'package:caderneta_campo_digital/components/page_base.dart';
import 'package:caderneta_campo_digital/controllers/record/plantation_record_controller.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  final String propriedadeId;
  final String? plotId;
  final bool isPlotRequest;

  const RecordPage({
    Key? key,
    required this.propriedadeId,
    this.plotId,
    required this.isPlotRequest,
  }) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  PlantationRecordController recordController = PlantationRecordController();

  @override
  Widget build(BuildContext context) {
    return PageBase(
      title: "Histórico",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: FutureBuilder(
              future: recordController.loadHistory(
                widget.propriedadeId,
                widget.isPlotRequest,
                widget.plotId,
              ),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? (snapshot.data == null ||
                            recordController.historyList.isEmpty)
                        ? Center(
                            child: Text(
                              recordController.failMessage,
                              style: TextStyle(
                                color: MyColors().blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                        : Column(
                            children: recordController.historyList,
                          )
                    : CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
