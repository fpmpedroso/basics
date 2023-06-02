import 'package:basics/app/core/database/sqlite_connection_factory.dart';
import 'package:basics/app/repositories/sqlite_repository/data_base_sqlite_repository.dart';
import 'package:basics/app/services/sqlite_service/database_sqlite_service.dart';
import 'package:flutter/material.dart';

class DataBaseSqliteController extends ChangeNotifier {
  //recebe-se uma instância de DataBaseSqliteService
  //final DatabaseSqliteService _databaseSqliteService;

  //variável observada para abrir e fechar o loader
  bool loaderIsOpen = false;

  //armazena-se a data selecionada
  DateTime? _selectedDate;

  //armazena-se uma instância de DataBaseSqliteRepository
  final DatabaseSqliteService _databaseSqliteService;

  //recebe-se no construtor
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
    loaderIsOpen = true;

    notifyListeners();
  }
}
