import 'package:games_app/core/error/exceptions.dart';
import 'package:get_storage/get_storage.dart';

abstract class GuestLocalDataSource {
  Future<void> cacheGuestInfo(String name);
  Future<String> getLastGuestInfo();
}

const cachedGuestInfo = 'CACHED_GUEST_INFO';

class GuestLocalDataSourceImpl implements GuestLocalDataSource {

  final GetStorage box;

  GuestLocalDataSourceImpl({
    required this.box
  });

  @override
  Future<void> cacheGuestInfo(String name) {
    return box.write(cachedGuestInfo, name);
  }

  @override
  Future<String> getLastGuestInfo() async {
    final result = await box.read(cachedGuestInfo);
    if ( result != null ) {
      return Future.value(result);
    } else {
      throw CacheException();
    }
  }
}