import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class LanguageCotroller extends GetxController {
  Locale _currentLocale = Locale('en');

  List<Locale> _supportedLocales = [Locale('en'), Locale('bn')];

  Locale get currentLocale => _currentLocale;

  List<Locale> get supportedLocales => _supportedLocales;

  void changeLocale(Locale locale) {
    if (_currentLocale == locale) {
      return;
    }
    _currentLocale = locale;
    update();
  }
}
