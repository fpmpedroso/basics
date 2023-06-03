import 'package:basics/app/repositories/data_sqlite_repository/data_sqlite_repository.dart';
import 'package:basics/app/services/data_sqlite_service/data_sqlite_service.dart';
import 'package:flutter/material.dart';

class DataSqliteController extends ChangeNotifier {
  //recebe uma instância da service
  DataSqliteService _dataSqliteService;

  DataSqliteController({required DataSqliteService dataSqliteService})
      : _dataSqliteService = dataSqliteService;

  //variável observável para mostrar e esconder o loader
  bool loaderIsOpen = false;

  //armazena-se a data selecionada
  DateTime? _selectedDate;

  //insere o valor da data que o usuário selecionou
  //dentro do CalendarButton, no método onTap(), aciona-se esse método
  set selectedDate(DateTime? selectedDate) {
    selectedDate = _selectedDate;
    notifyListeners();
  }

  //recupera o valor da data quando requisitado
  DateTime? get selectedDate => _selectedDate;

  //faz o processo de salvamento dos dados no database
  void save() async {
    loaderIsOpen = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    loaderIsOpen = false;

    notifyListeners();
  }
}
