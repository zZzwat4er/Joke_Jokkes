import 'package:json_annotation/json_annotation.dart';

part 'joke.g.dart';

@JsonSerializable()
class Joke {
  final List<String>? categories;
  final String? createdAt;
  final String? iconUrl;
  final String id;
  final String? updatedAt;
  final String? url;
  final String value;

  Joke({
    this.categories,
    this.createdAt,
    this.iconUrl,
    required this.id,
    this.updatedAt,
    this.url,
    required this.value,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);

  Map<String, dynamic> toMap() => {
    'id': id,
    'value': value,
  };

  @override
  String toString() => 'categories: $categories, created_at: $createdAt, icon_url: $iconUrl, id: $id, updated_at: $updatedAt, url: $url, value: $value';
}
