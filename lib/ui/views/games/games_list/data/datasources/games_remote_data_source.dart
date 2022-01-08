import 'dart:io';

import 'package:games_app/core/error/exceptions.dart';
import 'package:games_app/core/network/api.dart';
import 'package:games_app/ui/views/games/games_list/data/models/game_model.dart';
import 'package:http/http.dart' as http;

abstract class GamesRemoteDataSource {
  Future<List<GameModel>> getGamesList();
}

class GamesRemoteDataSourceImpl implements GamesRemoteDataSource {
  String authority = Api.url;
  String all = Api.all;
  String one = Api.one;

  @override
  Future<List<GameModel>> getGamesList() async {
    final response = await http.get(
      Uri.https(authority, all),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json"
      }
    );
    if (response.statusCode == 200) {
      return gameModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}