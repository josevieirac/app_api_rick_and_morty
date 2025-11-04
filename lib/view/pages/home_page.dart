import 'package:app_api/controller/favorite_controller.dart';
import 'package:app_api/controller/home_controller.dart';
import 'package:app_api/model/models/character_model.dart';
import 'package:app_api/model/repository/character_repository.dart';
import 'package:app_api/view/pages/favorites_page.dart';
import 'package:app_api/view/widgets/card_person_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final FavoriteController favoriteController;

  const MyApp({super.key, required this.favoriteController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        favoriteController: favoriteController,
        homeController: HomeController(
          characterRepository: CharacterRepository(
            baseUrl: 'https://rickandmortyapi.com/api',
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final HomeController homeController;
  final FavoriteController favoriteController;

  const HomePage({
    super.key,
    required this.homeController,
    required this.favoriteController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CharacterModel> listCharacter = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    widget.homeController.getAllCharacter().then((value) {
      setState(() {
        listCharacter = value;
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
        title: Text(
          'RICK AND MORTY API',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder:
                      (BuildContext context) => FavoritesPage(
                        favoriteController: widget.favoriteController,
                      ),
                ),
              );
            },
            icon: Icon(Icons.favorite_border_outlined, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body:
          isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : Padding(
                padding: const EdgeInsets.all(20),
                // TODO: criar variação do componente como grid
                child: ListView.separated(
                  itemBuilder:
                      (context, index) => CardPersonWidget(
                        character: listCharacter[index],
                        favoriteController: widget.favoriteController,
                      ),
                  separatorBuilder:
                      (contex, index) => const SizedBox(height: 20),
                  itemCount: listCharacter.length,
                ),
              ),
    );
  }
}
