import 'dart:convert';

import 'package:clean_architacture/core/databases/cache/cache_helper.dart';
import 'package:clean_architacture/core/errors/expentions.dart';
import 'package:clean_architacture/feature/user/data/model/user_model.dart';

class UserLocalDatasourse {
  final CacheHelper cache;
  final String key = 'cachedUser';

  UserLocalDatasourse({required this.cache});

  cachedUser(UserModel? userToCache) {
    if (userToCache != null) {
        cache.saveData(key: key, value: jsonEncode(userToCache.tojson()));
    } else {
      throw CacheExeption(errorMessage: 'No internet connection');
    }
  }

  Future<UserModel>getLastUser() {
    final jsonString = cache.getDataString(key: key);
    if(jsonString != null){
      return Future.value(UserModel.fromjson(json.decode(jsonString)));
    }else{
      throw CacheExeption(errorMessage: 'No internet connection');
    }
  }
}
