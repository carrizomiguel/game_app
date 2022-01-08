import 'dart:convert';
import 'package:games_app/ui/views/games/games_list/domain/entities/game.dart';
import 'package:intl/intl.dart';

List<GameModel> gameModelFromJson(String str) => List<GameModel>.from(
  json.decode(str).map((x) => GameModel.fromJson(x))
);

String gameModelToJson(List<GameModel> data) => json.encode(
  List<dynamic>.from(data.map((x) => x.toJson()))
);

class GameModel extends Game {
  GameModel({
    required int id,
    required String title,
    required String thumbnail,
    required String shortDescription,
    required String gameUrl,
    required String genre,
    required String platform,
    required String publisher,
    required String developer,
    required DateTime releaseDate,
    required String freetogameProfileUrl,
  }) : super(
    id: id,
    title: title,
    thumbnail: thumbnail,
    shortDescription: shortDescription,
    gameUrl: gameUrl,
    genre: genre,
    platform: platform,
    publisher: publisher,
    developer: developer,
    releaseDate: releaseDate,
    freetogameProfileUrl: freetogameProfileUrl,
  );

  static GameModel empty() => GameModel(
    id: 0,
    title: '',
    thumbnail: '',
    shortDescription: '',
    gameUrl: '',
    genre: '',
    platform: '',
    publisher: '',
    developer: '',
    releaseDate: DateTime.now(),
    freetogameProfileUrl: '',
  );

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    id: json["id"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    shortDescription: json["short_description"],
    gameUrl: json["game_url"],
    genre: json["genre"],
    platform: json["platform"],
    publisher: json["publisher"],
    developer: json["developer"],
    releaseDate: DateTime.parse(json["release_date"]),
    freetogameProfileUrl: json["freetogame_profile_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "thumbnail": thumbnail,
    "short_description": shortDescription,
    "game_url": gameUrl,
    "genre": genre,
    "platform": platform,
    "publisher": publisher,
    "developer": developer,
    "release_date": DateFormat('yyyy-MM-dd').format(releaseDate),
    "freetogame_profile_url": freetogameProfileUrl,
  };
}