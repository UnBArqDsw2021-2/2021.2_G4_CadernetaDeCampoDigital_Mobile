class TecnicoModel {
  late String cpf;
  late String dataNascimento;
  late String telefone;
  late String nome;
  late String crea;
  late String formacao;

  TecnicoModel(
    this.cpf,
    this.dataNascimento,
    this.telefone,
    this.nome,
    this.crea,
    this.formacao,
  );

  TecnicoModel.nulo() {
    cpf = '';
    dataNascimento = '';
    telefone = '';
    nome = '';
    crea = '';
    formacao = '';
  }
}
