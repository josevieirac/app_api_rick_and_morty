import 'package:app_api/model/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailPage({super.key, required this.character});

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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
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
                  child: Image.network(character.image ?? '', fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  character.name ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorStatus(),
                      ),
                    ),
                  ),
                  Text(
                    character.status ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  if (character.species != null)
                    Text(
                      ' - ${character.species ?? ''}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Last know location:',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  character.location?.name ?? 'vazio',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'First seen in:',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  character.origin?.name ?? 'vazio',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color colorStatus() {
    if (character.status == 'Alive') {
      return Colors.greenAccent;
    } else if (character.status == 'Dead') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
