import 'package:flutter/foundation.dart';

// ignore_for_file: avoid_print

class Log {
  static void d(dynamic message) {
    if (!kReleaseMode) {
      print('đ $message');
    }
  }

  static void e(dynamic message) {
    print('â $message');
  }

  static void i(dynamic message) {
    if (!kReleaseMode) {
      print('âšī¸ $message');
    }
  }
}
