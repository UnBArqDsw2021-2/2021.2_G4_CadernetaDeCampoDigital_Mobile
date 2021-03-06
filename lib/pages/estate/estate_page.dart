import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/controllers/estate/estate_controller.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/models/UserModel.dart';
import 'package:caderneta_campo_digital/pages/estate/components/plots_list.dart';
import 'package:caderneta_campo_digital/pages/home_produtor/home_produtor.dart';
import 'package:caderneta_campo_digital/pages/record/plantation_record.dart';
import 'package:caderneta_campo_digital/pages/update_property/update_property.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class EstatePage extends StatefulWidget {
  final Propriedade estate;
  final bool isProductorTheViewer;
  const EstatePage({
    Key? key,
    required this.estate,
    required this.isProductorTheViewer,
  }) : super(key: key);

  @override
  State<EstatePage> createState() => _EstatePageState();
}

class _EstatePageState extends State<EstatePage> {
  EstateController estateController = EstateController();
  UserModel user = SharedInfo.actualUser;

  void navigateToUpdateEstate() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return UpdatePropertyPage(estate: widget.estate);
    }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Tuple2 plots = widget.estate
        .getPlots(isProductorTheViewer: widget.isProductorTheViewer);

    return Scaffold(
      appBar: TopbarArrowBack(
        topbarHeight: size * 0.11,
        hasActions: true,
        title: widget.estate.complemento,
        onPressedHistoric: historyIconPressed,
        onPressedEdit: navigateToUpdateEstate,
      ),
      body: widget.estate.talhoes.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  user.isProductor
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: MaterialButton(
                            onPressed: () async {
                              bool response = await estateController
                                  .createPlot(widget.estate);

                              if (response) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => HomeProdutorPage(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: MyColors().blue,
                            child: Text(
                              "Adicionar talh??o",
                              style: TextStyle(
                                color: MyColors().white,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  PlotsList(
                    key: Key('estate_active_plots_list'),
                    plots: plots.item1,
                    title: 'Ativos',
                    estate: widget.estate,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    width: size.width,
                    height: 1,
                    color: Color(0xFF000000),
                  ),
                  PlotsList(
                    key: Key('estate_unactive_plots_list'),
                    plots: plots.item2,
                    title: 'Inativos',
                    estate: widget.estate,
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: Text(
                      'N??o existem talh??es',
                      style: Utils.estateTextStyle,
                    ),
                  ),
                ),
                user.isProductor
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(
                          onPressed: () async {
                            bool response = await estateController
                                .createPlot(widget.estate);

                            if (response) {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => HomeProdutorPage(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: MyColors().blue,
                          child: Text(
                            "Adicionar talh??o",
                            style: TextStyle(
                              color: MyColors().white,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
    );
  }

  void historyIconPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RecordPage(
          propriedadeId: widget.estate.id,
          isPlotRequest: false,
        ),
      ),
    );
  }
}
