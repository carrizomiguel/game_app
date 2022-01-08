import 'package:games_app/core/error/exceptions.dart';
import 'package:games_app/ui/views/games/games_list/data/models/game_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class GamesLocalDataSource {
  Future<List<GameModel>> getLastGamesList();
  Future<void> cacheGamesList(List<GameModel> list);
}

const cachedGamesList = "CACHED_GAMES_LIST";

class GamesLocalDataSourceImpl extends GamesLocalDataSource {
  final GetStorage box;

  GamesLocalDataSourceImpl({
    required this.box
  });

  @override
  Future<void> cacheGamesList(List<GameModel> list) {
    return box.write(cachedGamesList, gameModelToJson(list));
  }

  @override
  Future<List<GameModel>> getLastGamesList() async {
    final result = await box.read(cachedGamesList);
    if (result) {
      return Future.value(gameModelFromJson(result));
    } else {
      throw CacheException();
    }
  }
}