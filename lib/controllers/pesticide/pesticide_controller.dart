import 'package:caderneta_campo_digital/services/pesticide/pesticide_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PesticideController {
  PesticideService pesticideService = PesticideService();

  Future sendPesticideTypeForm(Map<String, dynamic> formsValue) async {
    try {
      Response response =
          await pesticideService.sendPesticideTypeRegister(formsValue);

      if (response.statusCode! >= 400) {
        debugPrint(response.data);

        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }

  Future sendPesticideForm(Map<String, dynamic> formsValue) async {
    try {
      Response response =
          await pesticideService.sendPesticideRegister(formsValue);

      if (response.statusCode! >= 400) {
        debugPrint(response.data);

        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }

  Future sendPesticideApplicationForm(Map<String, dynamic> formsValue) async {
    try {
      Response response =
          await pesticideService.sendPesticideApplication(formsValue);

      if (response.statusCode! >= 400) {
        debugPrint(response.data);

        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }

  Future sendPesticideApplicationPhotoForm(
    Map<String, dynamic> formsValue,
    Map<String, MultipartFile> fileMap,
  ) async {
    formsValue.addAll(fileMap);
    try {
      Response response =
          await pesticideService.sendPesticideApplicationPhoto(formsValue);

      if (response.statusCode! >= 400) {
        debugPrint(response.data);

        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }
}
