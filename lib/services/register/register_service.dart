import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class RegisterService {
  Future<Response> sendTechnicianRegister(
    Map<String, dynamic> infoTechnician,
  ) async {
    Response response = await DioClient.dioClient.post('api/tecnico/', {
      'usuario': {
        'cpf': infoTechnician['cpf'],
        'dataNascimento': infoTechnician['dataNascimento'],
        'telefone': infoTechnician['telefone'],
        'nome': infoTechnician['nome'],
        'senha': infoTechnician['senha'],
      },
      'crea': infoTechnician['crea'],
      'formacao': infoTechnician['formacao'],
      'email': infoTechnician['email'],
    });

    return response;
  }

  Future<Response> sendProducerRegister(
    Map<String, dynamic> infoProducer,
  ) async {
    Response response = await DioClient.dioClient.post('api/produtor/', {
      'usuario': {
        'cpf': infoProducer['cpf'],
        'dataNascimento': infoProducer['dataNascimento'],
        'telefone': infoProducer['telefone'],
        'nome': infoProducer['nome'],
        'senha': infoProducer['senha'],
      },
      'dap': infoProducer['dap'],
    });

    return response;
  }
}
