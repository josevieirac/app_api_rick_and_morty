class OriginModel {
  final String? name;
  final String? url;

  const OriginModel({this.name, this.url});

  static OriginModel fromJson(Map<String, dynamic> json) {
    return OriginModel(name: json['nome'], url: json['url']);
  }
}
