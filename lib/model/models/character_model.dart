import 'package:app_api/model/models/location_model.dart';
import 'package:app_api/model/models/origin_model.dart';

class CharacterModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OriginModel? origin;
  final LocationModel? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  const CharacterModel({
    this.created,
    this.episode,
    this.gender,
    this.id,
    this.image,
    this.location,
    this.name,
    this.origin,
    this.species,
    this.status,
    this.type,
    this.url,
  });

  static CharacterModel fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: OriginModel.fromJson(json['origin']),
      location: LocationModel.fromJson(json['location']),
      image: json['image'],
      episode: json['eposide'],
      url: json['url'],
      created: json['created'],
    );
  }
}
