import 'package:news_flutter_app/core/databases/api/api_consumer.dart';
import 'package:news_flutter_app/core/databases/api/end_points.dart';
import 'package:news_flutter_app/data/models/news_model.dart';

class NewsRemoteDatasource {
  final ApiConsumer api;

  NewsRemoteDatasource({required this.api});
  Future<NewsModel> getuser() async {
    final response = await api.get(
      EndPoints.topheadlines,
      queryParameters: {
        'country': 'us',
        'apiKey': ApiKey.key,
      },
    );
    return NewsModel.fromJson(response);
  }
}
