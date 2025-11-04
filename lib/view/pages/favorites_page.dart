import 'package:app_api/controller/favorite_controller.dart';
import 'package:app_api/model/models/character_model.dart';
import 'package:app_api/view/widgets/card_person_widget.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  final FavoriteController favoriteController;

  const FavoritesPage({super.key, required this.favoriteController});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<CharacterModel> favorites = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    widget.favoriteController.getCharacterByIds().then((value) {
      setState(() {
        favorites = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 31, 31, 31),
        centerTitle: true,
        title: Text('FAVORITOS', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body:
          isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  itemBuilder:
                      (context, index) => CardPersonWidget(
                        character: favorites[index],
                        favoriteController: widget.favoriteController,
                      ),
                  separatorBuilder:
                      (contex, index) => const SizedBox(height: 20),
                  itemCount: favorites.length,
                ),
              ),
    );
  }
}
