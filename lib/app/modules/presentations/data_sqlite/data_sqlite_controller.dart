//essa classe estende a classe DefaultChangeNotifier que por sua vez já estende ChangeNotifier
//ela possibilita a lógica das mensagens e loading ao usuário

import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/notifier/default_change_notifier.dart';
import 'package:basics/app/models/data_sqlite_model.dart';
import 'package:basics/app/services/data_sqlite_service/data_sqlite_service.dart';

class DataSqliteController extends DefaultChangeNotifier {
  //recebe uma instância da service
  final DataSqliteService _dataSqliteService;

  //recebe uma instância de Logger
  final AppLogger _log;

  //msg de sucesso
  String? msgSucesso;

  //armazena-se a data selecionada
  DateTime? _selectedDate;

  //armazena a lista de dados
  var listaDados = <DataSqliteModel>[];

  //construtor para inicializar o dataSqliteService
  DataSqliteController(
      {required DataSqliteService dataSqliteService, required AppLogger log})
      : _dataSqliteService = dataSqliteService,
        _log = log;

  //sabe que existe uma msg de sucesso quando requisitada
  bool get hasInfo => msgSucesso != null;

  //insere o valor da data que o usuário selecionou
  //dentro do CalendarButton, no método onTap(), aciona-se esse método
  set selectedDate(DateTime? selectedDate) {
    //volta os valores iniciais para mudança da data
    resetState();

    _selectedDate = selectedDate;
    notifyListeners();
  }

  //recupera o valor da data quando requisitado
  DateTime? get selectedDate => _selectedDate;

  //faz o processo de salvamento dos dados no database
  void save(String description) async {
    try {
      showLoadingAndResetState();

      //reseta qualquer tipo de msg
      msgSucesso = null;

      notifyListeners();

      //certifica-se que o usuário setou a data
      if (_selectedDate != null) {
        await _dataSqliteService.save(_selectedDate!, description);

        //transfere a msg de sucesso
        msgSucesso = 'Dados cadastrados :)';

        //aciona o método para sucesso
        success();
      } else {
        //aciona o método para exibir o erro
        setError('Oops.. a data não foi inserirda :(');
      }
    } catch (e, s) {
      _log.error('erro ao salvar os dados', e, s);
      setError('Oops.. erro ao salvar os dados :(');
    } finally {
      hideLoading();
      notifyListeners();

      //busca todos os registros e atualiza a tela
      findAll();
    }
  }

  //faz o processo de busca de todos os dados
  Future<void> findAll() async {
    try {
      //tratativas iniciais
      showLoadingAndResetState();
      notifyListeners();

      //chama o método para obter a lista de dados
      final newList = await _dataSqliteService.findAll();

      //atualiza a lista já existente com os novos valores;
      listaDados = [...newList];
    } catch (e, s) {
      _log.error('erro ao pesquisar os dados', e, s);
      setError('Oops.. erro ao pesquisar os dados');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
