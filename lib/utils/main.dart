import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Utils {
  final maskCpf = MaskTextInputFormatter(
      mask: "###########", filter: {"#": RegExp(r'[0-9]')});
  final maskData = MaskTextInputFormatter(
      mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')});
  final maskTelefone = MaskTextInputFormatter(
      mask: "(##)#####-####", filter: {"#": RegExp(r'[0-9]')});

  String? clearMask(String? string) {
    string!.replaceAll(new RegExp(r'[^\w\s]+'), '');
    return string;
  }

  String? clearData(String? data) {
    var newData = data!.split("/");
    return (newData.reversed).join("-");
  }

  Utils();
}
