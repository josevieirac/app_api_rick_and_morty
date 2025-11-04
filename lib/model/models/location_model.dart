class LocationModel {
  final String? name;
  final String? url;

  const LocationModel({this.name, this.url});

  static LocationModel fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json['name'], url: json['url']);
  }
}
