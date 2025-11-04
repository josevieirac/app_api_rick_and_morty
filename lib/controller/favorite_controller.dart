import 'dart:convert';

import 'package:app_api/model/models/character_model.dart';
import 'package:app_api/model/repository/character_repository.dart';
import 'package:flutter/services.dart' show rootBundle;

class FavoriteController {
  final CharacterRepository characterRepository;

  FavoriteController({required this.characterRepository});

  List<int> favoritesCharacterIds = [];
  //final file = File('../../assets/favorite.json');

  void loadFavorites() async {
    //final content = await file.readAsString();
    final String content = await rootBundle.loadString('assets/favorite.json');

    final result = jsonDecode(content);

    favoritesCharacterIds = List<int>.from(result);
  }

  void addFavorite(int? id) {
    if (id != null) {
      favoritesCharacterIds.add(id);
    }
  }

  void removeFavorite(int? id) {
    if (id != null) {
      favoritesCharacterIds.remove(id);
    }
  }

  void updateFile() {
    //rootBundle. ('assets/favorite.json');
  }

  Future<List<CharacterModel>> getCharacterByIds() async {
    return characterRepository.getCharacterByIds(favoritesCharacterIds);
  }
}
