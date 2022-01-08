import 'dart:convert';
import 'dart:io';

import 'package:games_app/core/error/exceptions.dart';
import 'package:games_app/core/network/api.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';
import 'package:http/http.dart' as http;

abstract class GameDetailRemoteDataSource {
  Future<GameDetailModel> getGameById(int id);
}

class GameDetailRemoteDataSourceImpl implements GameDetailRemoteDataSource {
  String authority = Api.url;
  String one = Api.one;
  
  @override
  Future<GameDetailModel> getGameById(int id) async {
    final response = await http.get(
      Uri.https(authority, one, { "id": id.toString() }),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json"
      }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> decoded = json.decode(response.body);
      return GameDetailModel.fromJson(decoded);
    } else {
      throw ServerException();
    }
  }
}