import 'dart:convert';

import 'package:app_api/model/models/character_model.dart';
import 'package:http/http.dart' as http;

class CharacterRepository {
  final String baseUrl;

  const CharacterRepository({required this.baseUrl});

  Future<List<CharacterModel>> getAllCharacter() async {
    final response = await http.get(Uri.parse('$baseUrl/character'));

    final map = jsonDecode(response.body);

    final character = map['results'];

    final result =
        (character as List).map((c) => CharacterModel.fromJson(c)).toList();

    return result;
  }

  Future<List<CharacterModel>> getCharacterByIds(List<int> ids) async {
    if (ids.isEmpty) return [];

    final response = await http.get(
      Uri.parse('$baseUrl/character/${ids.join(',')}'),
    );

    final character = jsonDecode(response.body);

    if (ids.length == 1) {
      return [CharacterModel.fromJson(character)];
    }

    final result =
        (character as List).map((c) => CharacterModel.fromJson(c)).toList();

    return result;
  }
}
