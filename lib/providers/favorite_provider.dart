
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<int> _favoriteCandiIds = [];

  List<int> get favoriteCandiIds => _favoriteCandiIds;

  bool isFavorite(int candiId) {
    return _favoriteCandiIds.contains(candiId);
  }

  void toggleFavorite(int candiId) {
    if (_favoriteCandiIds.contains(candiId)) {
      _favoriteCandiIds.remove(candiId);
    } else {
      _favoriteCandiIds.add(candiId);
    }

    notifyListeners();
  }
}
