import 'package:flutter/foundation.dart';

class MonedasProvider with ChangeNotifier {
  int _monedas = 0;

  int get monedas => _monedas;

  void actualizarMonedas(int nuevasMonedas) {
    _monedas = nuevasMonedas;
    notifyListeners();
  }
}
