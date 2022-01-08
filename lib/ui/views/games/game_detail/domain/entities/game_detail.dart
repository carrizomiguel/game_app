import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';

class GameDetail {
  GameDetail({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.status,
    required this.shortDescription,
    required this.description,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
    required this.minimumSystemRequirements,
    required this.screenshots,
  });

  int id;
  String title;
  String thumbnail;
  String status;
  String shortDescription;
  String description;
  String gameUrl;
  String genre;
  String platform;
  String publisher;
  String developer;
  DateTime releaseDate;
  String freetogameProfileUrl;
  MinimumSystemRequirementsModel minimumSystemRequirements;
  List<ScreenshotsModel> screenshots;
}

class MinimumSystemRequirements {
  MinimumSystemRequirements({
    this.os,
    this.processor,
    this.memory,
    this.graphics,
    this.storage,
  });

  String? os;
  String? processor;
  String? memory;
  String? graphics;
  String? storage;
}

class Screenshots {
  Screenshots({
    required this.id,
    required this.image,
  });

  int id;
  String image;
}
