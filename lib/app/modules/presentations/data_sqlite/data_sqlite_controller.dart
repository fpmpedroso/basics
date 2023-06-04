//essa classe estende a classe DefaultChangeNotifier que por sua vez já estende ChangeNotifier
//ela possibilita a lógica das mensagens e loading ao usuário

import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/notifier/default_change_notifier.dart';
import 'package:basics/app/services/data_sqlite_service/data_sqlite_service.dart';

class DataSqliteController extends DefaultChangeNotifier {
  //recebe uma instância da service
  final DataSqliteService _dataSqliteService;

  //recebe uma instância de Logger
  final AppLogger _log;

  //armazena-se a data selecionada
  DateTime? _selectedDate;

  //construtor para inicializar o dataSqliteService
  DataSqliteController(
      {required DataSqliteService dataSqliteService, required AppLogger log})
      : _dataSqliteService = dataSqliteService,
        _log = log;

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
    showLoadingAndResetState();
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    hideLoading();
    setError('erro');
    notifyListeners();

    /*
    try {
      showLoadingAndResetState();
      notifyListeners();

      //certifica-se que o usuário setou a data
      if (_selectedDate != null) {
        await _dataSqliteService.save(_selectedDate!, description);

        //aciona o método para sucesso
        success();
      } else {
        //aciona o método para exibir o erro
        setError('Ops.. a data não foi inserirda :(');
      }
    } catch (e, s) {
      _log.error('erro ao salvar os dados', e, s);
      setError('Opss.. erro ao salvar os dados :(');
    } finally {
      hideLoading();
      notifyListeners();
    }
    */
  }
}
