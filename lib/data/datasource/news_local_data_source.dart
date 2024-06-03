import 'dart:convert';

import 'package:news_flutter_app/core/databases/cache/cache_helper.dart';
import 'package:news_flutter_app/core/errors/expentions.dart';
import 'package:news_flutter_app/data/models/news_model.dart';

class NewsLocalDataSource {
  final CacheHelper cache;
  final String key = 'Cachednews';

  NewsLocalDataSource({required this.cache});
  cachNews(NewsModel? newstocache) {
    if (newstocache != null) {
      cache.saveData(key: key, value: json.encode(newstocache.toJson()));
    } else {
      throw CacheExeption(errorMessage: 'No internet connection');
    }
  }

  Future<NewsModel> getLastNews() {
    final jsonString = cache.getData(key: key);
    if (jsonString != null) {
      return Future.value(NewsModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: 'No Internet connection');
    }
  }
}
