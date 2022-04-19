import 'package:caderneta_campo_digital/services/update_profile/update_profile_service.dart';
import 'package:dio/dio.dart';

class UpdateProfileController {
  UpdateProfileService updateProfileService = UpdateProfileService();

  Future sendForm(Map<String, dynamic> formsValue) async {
    try {
      Response response = await updateProfileService.updateProfile(formsValue);

      if (response.statusCode! >= 400) {
        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }
}
