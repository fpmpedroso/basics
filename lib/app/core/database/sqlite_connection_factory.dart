//cria-se uma classe do tipo Singleton para existir apenas uma instância no projeto

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:synchronized/synchronized.dart';

class SqliteConnectionFactory {
  //constantes
  static const _VERSION = 1; //última versão do Banco que será utilizada
  static const _DATABASE_NAME = 'DATABASE_BASICS'; //nome do Banco

  //atributo da instância da classe
  static SqliteConnectionFactory? _instance;

  //atributo da instância de Database
  Database? _db;

  //atributo que impede abertura de mais de uma conexão ao mesmo tempo
  final _lock = Lock();

  //construtor privado para que ninguém possa instanciar
  SqliteConnectionFactory._();

  //construtor do tipo factory para controlar a instância
  factory SqliteConnectionFactory() {
    //somente cria-se uma instância se ainda não existir
    _instance ??= SqliteConnectionFactory._();

    //retorna-se a instância, forçando que não seja nula, pois se tem a certeza que não será
    return _instance!;
  }

  //método de abertura da conexão com o Banco de Dados. Retorna-se um objeto de conexão
  Future<Database> openConnection() async {
    //obtém-se o caminho que o Banco será salvo no dispositivo
    var databasePath = await getDatabasesPath();

    //em conjunto com o package Path faz a juntada do caminho e o nome do Banco
    var databaseFinalPath = join(databasePath, _DATABASE_NAME);

    ///somente se a instância do Banco for nula, faz o seguinte processo:
    ///usa-se a Classe Lock() que permite que o processo de abertura do Banco aconteça uma vez a cada requisição
    ///ou seja, ele não autoriza mais de uma abertura do Banco por vez
    ///para controlar esse fluxo, a abertura do Banco só acontece se a instância do Banco (_db) for nula
    ///ao fechar a conexão através do método de encerramento, torna-se o valor da instância do Banco como null para que
    ///todo o processo possa acontecer de novo, sempre um por vez
    if (_db == null) {
      await _lock.synchronized(() async {
        //verifica se a instância do Banco é nula, caso contrário não permite que seja aberta a conexão
        if (_instance == null) {
          //abre-se a conexão informando o caminho, a versão que está sendo usada, e os métodos de abertura
          _db = await openDatabase(databaseFinalPath,
              version: _VERSION,
              onConfigure: _onConfigure,
              onCreate: _onCreate,
              onUpgrade: _onUpgrade,
              onDowngrade: _onDowngrade);
        }
      });
    }

    //retorna-se a instância de _db, forçando-a como não nula, pois sempre haverá um resultado por ter sido criada sua instância no chamamento do método
    return _db!;
  }

  //método para fechar a conexão
  void closeConnection() {
    //fecha-se a conexão
    _db?.close();

    //limpa-se a instância do Banco para permitir que todo processo de conexão aconteça novamente
    _db == null;
  }

  /// #### criação dos métodos de conexão do Banco ####

  //

  //configurações iniciais da conexão
  Future<void> _onConfigure(Database db) async {
    //força a aceitação de foreing keys, pois por padrão o Sqlite não aceita
    await db.execute('PRAGMA foreing_keys = ON');
  }

  //executado quando não ainda não existe o Banco de Dados criado no dispositivo
  Future<void> _onCreate(Database db, int version) async {}

  //executado quando já existe o Banco criado no dispositivo e existe uma versão mais nova do que a versão do usuário
  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {}

  //executado quando já existe o Banco criado no dispositivo e se pede uma versão mais antiga (acontece por questões de problemas em versões novas)
  Future<void> _onDowngrade(Database db, int oldVersion, int version) async {}
}
