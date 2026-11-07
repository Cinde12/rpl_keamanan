import 'package:flutter/foundation.dart';

class Logger {
  static void debug(String message) {
    _log('DEBUG', message);
  }

  static void info(String message) {
    _log('INFO', message);
  }

  static void warning(String message) {
    _log('WARNING', message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _log('ERROR', message);
    if (error != null && kDebugMode) {
      print('Error details: $error');
    }
    if (stackTrace != null && kDebugMode) {
      print('StackTrace: $stackTrace');
    }
  }

  static void _log(String level, String message) {
    if (kDebugMode) {
      final timestamp = DateTime.now().toIso8601String();
      print('[$timestamp] [$level] $message');
    }
  }
}
