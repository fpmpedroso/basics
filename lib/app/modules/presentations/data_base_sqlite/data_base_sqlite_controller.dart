import 'package:basics/app/core/ui/helpers/loader.dart';
import 'package:basics/app/services/sqlite_service/database_sqlite_service.dart';
import 'package:flutter/material.dart';

class DataBaseSqliteController extends ChangeNotifier {
  //recebe-se uma instância de DataBaseSqliteService
  final DatabaseSqliteService _databaseSqliteService;

  //armazena-se a data selecionada
  DateTime? _selectedDate;

  DataBaseSqliteController(
      {required DatabaseSqliteService databaseSqliteService})
      : _databaseSqliteService = databaseSqliteService;

  //insere o valor da data que o usuário selecionou
  //dentro do CalendarButton, no método onTap(), aciona-se esse método
  set selectedDate(DateTime? selectedDate) {
    _selectedDate = selectedDate;

    //notifica os ouvintes que houve alteração da variável
    notifyListeners();
  }

  //recupera o valor
  DateTime? get selectedDate => _selectedDate;

  void save(String formDescriptionEC) {
    
  }
}
