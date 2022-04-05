import 'package:dio/dio.dart';

import '../../services/home_productor/home_productor_service.dart';

class HomeProdutorController {
  HomeProdutorService homeProdutorService = HomeProdutorService();
  bool loading = false;
  List<dynamic> estates = [];

  Future<bool> getEstates() async {
    Response response = await homeProdutorService.getData();
    loading = false;

    if(response.data == null){
      return false;
    }
    estates = response.data;

    return true;
  }
}
