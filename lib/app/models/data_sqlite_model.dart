class DataSqliteModel {
  final int id;
  final DateTime dateTime;
  final String descricao;

  DataSqliteModel({
    required this.id,
    required this.dateTime,
    required this.descricao,
  });

  //construtor utilitário para converter os dados do DB para o objeto modelo
  factory DataSqliteModel.loadFromDB(Map<String, dynamic> dados) {
    return DataSqliteModel(
      id: dados['id'], 
      dateTime: DateTime.parse(dados['data_hora']), 
      descricao: dados['descricao']
    );
  }
}
