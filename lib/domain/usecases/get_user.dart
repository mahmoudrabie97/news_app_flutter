import 'package:dartz/dartz.dart';
import 'package:news_flutter_app/core/errors/failure.dart';
import 'package:news_flutter_app/data/models/news_model.dart';
import 'package:news_flutter_app/domain/entities/news_entity.dart';
import 'package:news_flutter_app/domain/repositres/news_repositry.dart';

class GetNews {
  final NewsRepsitry repsitry;

  GetNews({required this.repsitry});
  Future<Either<Failure, NewsModel>> call() {
    return repsitry.getNews();
  }
}
