import 'package:basics/app/services/data_sqlite_service/data_sqlite_service.dart';
import 'package:flutter/material.dart';

class DataSqliteController extends ChangeNotifier {
  DataSqliteService _dataSqliteService;

  DataSqliteController({required DataSqliteService dataSqliteService})
      : _dataSqliteService = dataSqliteService;

  //variável observável para mostrar e esconder o loader
  bool loaderIsOpen = false;

  void save() async {
    loaderIsOpen = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    loaderIsOpen = false;

    notifyListeners();
  }
}
