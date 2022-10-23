import 'package:coligo/l10n/supported_locale.dart';
import 'package:flutter/cupertino.dart';

class LocalProvider with ChangeNotifier {
  Locale? _locale = const Locale('en');
  Locale? get locale => _locale;
  void setLocale(Locale loc) {
    if (!L10n.support.contains(loc)) return;
    _locale = loc;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
