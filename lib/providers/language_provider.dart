import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  int _selectedLanguage = 0;

  int get selectedlanguage => _selectedLanguage;

  void setLanguage(int language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
