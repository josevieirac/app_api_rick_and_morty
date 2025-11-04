import 'package:app_api/controller/favorite_controller.dart';
import 'package:app_api/model/models/character_model.dart';
import 'package:app_api/view/pages/character_detail_page.dart';
import 'package:flutter/material.dart';

class CardPersonWidget extends StatefulWidget {
  final CharacterModel character;
  final FavoriteController favoriteController;

  const CardPersonWidget({
    super.key,
    required this.character,
    required this.favoriteController,
  });

  @override
  State<CardPersonWidget> createState() => _CardPersonWidgetState();
}

class _CardPersonWidgetState extends State<CardPersonWidget> {
  @override
  Widget build(BuildContext context) {
    final isFavorite = widget.favoriteController.favoritesCharacterIds.contains(
      widget.character.id,
    );
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CharacterDetailPage(character: widget.character),
            ),
          ),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.character.image ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 7),
                  child: Text(
                    widget.character.name ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (isFavorite) {
                      widget.favoriteController.removeFavorite(
                        widget.character.id,
                      );
                    } else {
                      widget.favoriteController.addFavorite(
                        widget.character.id,
                      );
                    }
                  });
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: isFavorite ? Colors.red : Colors.grey,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
