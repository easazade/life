import 'package:flutter/foundation.dart';

// ignore_for_file: avoid_print

class Log {
  static void d(dynamic message) {
    if (!kReleaseMode) {
      print('🐛 $message');
    }
  }

  static void e(dynamic message) {
    print('❌ $message');
  }

  static void i(dynamic message) {
    if (!kReleaseMode) {
      print('ℹ️ $message');
    }
  }
}
