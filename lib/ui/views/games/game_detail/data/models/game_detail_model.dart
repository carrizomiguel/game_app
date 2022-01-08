import 'dart:convert';

import 'package:games_app/ui/views/games/game_detail/domain/entities/game_detail.dart';
import 'package:intl/intl.dart';

List<GameDetailModel> gameModelFromJson(String str) => List<GameDetailModel>.from(
  json.decode(str).map((x) => GameDetailModel.fromJson(x))
);

String gameModelToJson(List<GameDetailModel> data) => json.encode(
  List<dynamic>.from(data.map((x) => x.toJson()))
);

class GameDetailModel extends GameDetail {
  GameDetailModel({
    required int id,
    required String title,
    required String thumbnail,
    required String status,
    required String shortDescription,
    required String description,
    required String gameUrl,
    required String genre,
    required String platform,
    required String publisher,
    required String developer,
    required DateTime releaseDate,
    required String freetogameProfileUrl,
    required MinimumSystemRequirementsModel minimumSystemRequirements,
    required List<ScreenshotsModel> screenshots,
  }) : super(
    id: id,
    title: title,
    thumbnail: thumbnail,
    status: status,
    shortDescription: shortDescription,
    description: description,
    gameUrl: gameUrl,
    genre: genre,
    platform: platform,
    publisher: publisher,
    developer: developer,
    releaseDate: releaseDate,
    freetogameProfileUrl: freetogameProfileUrl,
    minimumSystemRequirements: minimumSystemRequirements,
    screenshots: screenshots,
  );

  static GameDetailModel empty() => GameDetailModel(
    id: 0,
    title: '',
    thumbnail: '',
    status: '',
    shortDescription: '',
    description: '',
    gameUrl: '',
    genre: '',
    platform: '',
    publisher: '',
    developer: '',
    releaseDate: DateTime.now(),
    freetogameProfileUrl: '',
    minimumSystemRequirements: MinimumSystemRequirementsModel.empty(),
    screenshots: [],
  );

  factory GameDetailModel.fromJson(
    Map<String, dynamic> json
  ) => GameDetailModel(
    id: json["id"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    status: json["status"],
    shortDescription: json["short_description"],
    description: json["description"],
    gameUrl: json["game_url"],
    genre: json["genre"],
    platform: json["platform"],
    publisher: json["publisher"],
    developer: json["developer"],
    releaseDate: DateTime.parse(json["release_date"]),
    freetogameProfileUrl: json["freetogame_profile_url"],
    minimumSystemRequirements: MinimumSystemRequirementsModel.fromJson(
      json["minimum_system_requirements"]
    ),
    screenshots: List<ScreenshotsModel>.from(
      json["screenshots"].map((x) => ScreenshotsModel.fromJson(x))
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "thumbnail": thumbnail,
    "status": status,
    "short_description": shortDescription,
    "description": description,
    "game_url": gameUrl,
    "genre": genre,
    "platform": platform,
    "publisher": publisher,
    "developer": developer,
    "release_date": DateFormat('yyyy-MM-dd').format(releaseDate),
    "freetogame_profile_url": freetogameProfileUrl,
    "minimum_system_requirements": minimumSystemRequirements,
    "screenshots": screenshots,
  };
}

class MinimumSystemRequirementsModel extends MinimumSystemRequirements {
  MinimumSystemRequirementsModel({
    String? os,
    String? processor,
    String? memory,
    String? graphics,
    String? storage,
  }) : super(
    os: os,
    processor: processor,
    memory: memory,
    graphics: graphics,
    storage: storage,
  );

  static MinimumSystemRequirementsModel empty() {
    return MinimumSystemRequirementsModel(
      os: '',
      processor: '',
      memory: '',
      graphics: '',
      storage: '',
    );
  }

  factory MinimumSystemRequirementsModel.fromJson(
    Map<String, dynamic> json
  ) => MinimumSystemRequirementsModel(
    os: json["os"],
    processor: json["processor"],
    memory: json["memory"],
    graphics: json["graphics"],
    storage: json["storage"],
  );

  Map<String, dynamic> toJson() => {
    "os": os,
    "processor": processor,
    "memory": memory,
    "graphics": graphics,
    "storage": storage,
  };
}

class ScreenshotsModel extends Screenshots {
  ScreenshotsModel({
    required int id,
    required String image,
  }) : super(
    id: id,
    image: image,
  );

  static ScreenshotsModel empty() => ScreenshotsModel(
    id: 0,
    image: '',
  );

  factory ScreenshotsModel.fromJson(
    Map<String, dynamic> json
  ) => ScreenshotsModel(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}