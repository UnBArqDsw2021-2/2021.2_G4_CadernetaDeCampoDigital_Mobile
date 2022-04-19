import 'package:caderneta_campo_digital/services/plantation_details/plantations_details_service.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class PlantationDetailsController {
  PlantationDetailsService details = PlantationDetailsService();
  dynamic details_info;
  Future getDetails(String id) async {
    Response? response = await details.getData(id);
    details_info = response?.data;
  }

  String convertDataFromServer(String date) {
    var dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat("dd/MM/yyyy");

    return formatter.format(dateTime);
  }
}
