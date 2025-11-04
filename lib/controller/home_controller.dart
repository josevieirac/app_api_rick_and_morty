import 'package:app_api/model/models/character_model.dart';
import 'package:app_api/model/repository/character_repository.dart';

class HomeController {
  final CharacterRepository characterRepository;

  const HomeController({required this.characterRepository});

  Future<List<CharacterModel>> getAllCharacter() async {
    return await characterRepository.getAllCharacter();
  }
}
