import 'package:dartz/dartz.dart';
import 'package:news_flutter_app/core/errors/failure.dart';
import 'package:news_flutter_app/data/models/news_model.dart';

abstract class NewsRepsitry {
  Future<Either<Failure, NewsModel>> getNews();
}
