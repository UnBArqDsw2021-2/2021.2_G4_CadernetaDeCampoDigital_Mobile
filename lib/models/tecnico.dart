class Tecnico {
  late String cpf;
  late String dataNascimento;
  late String telefone;
  late String nome;
  late String crea;
  late String formacao;

  Tecnico(
    this.cpf,
    this.dataNascimento,
    this.telefone,
    this.nome,
    this.crea,
    this.formacao,
  );

  Tecnico.nulo() {
    cpf = '';
    dataNascimento = '';
    telefone = '';
    nome = '';
    crea = '';
    formacao = '';
  }
}
