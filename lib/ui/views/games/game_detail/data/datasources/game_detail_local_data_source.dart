import 'package:games_app/core/error/exceptions.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class GameDetailLocalDataSource {
  Future<GameDetailModel> getLastGameDetailById(int id);
  Future<void> cacheGameDetail(GameDetailModel detail);
}

const cachedGamesList = "CACHED_GAMES_LIST";

class GameDetailLocalDataSourceImpl extends GameDetailLocalDataSource {
  final GetStorage box;

  GameDetailLocalDataSourceImpl({
    required this.box
  });

  @override
  Future<void> cacheGameDetail(GameDetailModel detail) {
    return box.write(cachedGamesList, detail.toJson());
  }

  @override
  Future<GameDetailModel> getLastGameDetailById(int id) async {
    final result = await box.read(cachedGamesList);
    if (result) {
      final gameModel = GameDetailModel.fromJson(result);
      if (gameModel.id == id) {
        return Future.value(gameModel);
      } else {
        throw ElementNotFoundException();
      }
    } else {
      throw CacheException();
    }
  }
}