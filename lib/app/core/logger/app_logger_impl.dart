//Contém a implementação dos tipos de log a serem apresentados

/// USO:
/// - injeção de dependência em app_module (tipada a classe abstrata);
/// - variável que contenha uma instância de read() tipando a classe abstrata (ex em how_navigate_page.dart);
/// - acionamento do método desejado;
/// - para uso do append, ex:
///             log.append('xx');
///             log.append('yyy');
///             log.closeAppend();

import 'package:basics/app/core/logger/app_logger.dart';
import 'package:logger/logger.dart';

class AppLoggerImpl implements AppLogger {
  final logger = Logger();
  var messages = <String>[];

  @override
  void debug(message, [error, StackTrace? stackTrace]) =>
      logger.d(message, error, stackTrace);

  @override
  void error(message, [error, StackTrace? stackTrace]) =>
      logger.e(message, error, stackTrace);

  @override
  void info(message, [error, StackTrace? stackTrace]) =>
      logger.i(message, error, stackTrace);

  @override
  void warning(message, [error, StackTrace? stackTrace]) =>
      logger.w(message, error, stackTrace);

  @override
  void append(message) {
    messages.add(message);
  }

  @override
  void closeAppend() {
    info(messages.join('\n'));
    messages = [];
  }
}
