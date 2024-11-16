import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

abstract class Console {
  static final _log = Logger(filter: _LogFilter());

  static void log(dynamic message) => _log.d(message);
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => !kReleaseMode;
}
