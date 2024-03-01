import 'package:flutter/foundation.dart';

class UserCoins extends ChangeNotifier {
  double _coins = 0;

  double get coins => _coins;

  void setCoins(double newCoins) {
    _coins = newCoins;
    notifyListeners();
  }
}
