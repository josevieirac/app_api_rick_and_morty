import 'package:app_api/controller/favorite_controller.dart';
import 'package:app_api/model/repository/character_repository.dart';
import 'package:app_api/view/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final favoriteController = FavoriteController(
    characterRepository: CharacterRepository(
      baseUrl: 'https://rickandmortyapi.com/api',
    ),
  );

  favoriteController.loadFavorites();

  runApp(MyApp(favoriteController: favoriteController));
}
