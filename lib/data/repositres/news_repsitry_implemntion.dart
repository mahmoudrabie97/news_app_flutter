import 'package:dartz/dartz.dart';
import 'package:news_flutter_app/core/connection/network_info.dart';
import 'package:news_flutter_app/core/errors/expentions.dart';
import 'package:news_flutter_app/core/errors/failure.dart';
import 'package:news_flutter_app/data/datasource/news_local_data_source.dart';
import 'package:news_flutter_app/data/datasource/news_remote_datasource.dart';
import 'package:news_flutter_app/data/models/news_model.dart';
import 'package:news_flutter_app/domain/repositres/news_repositry.dart';

class NewsRepoImplement extends NewsRepsitry {
  final NetworkInfo networkInfo;
  final NewsRemoteDatasource remoteDatasource;
  final NewsLocalDataSource localDataSource;

  NewsRepoImplement(
      {required this.remoteDatasource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, NewsModel>> getNews() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteuser = await remoteDatasource.getuser();
        print(remoteuser.articles!.length);
        localDataSource.cachNews(remoteuser);
        return right(remoteuser);
      } on ServerException catch (e) {
        return left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final locacalNews = await localDataSource.getLastNews();
        return right(locacalNews);
      } on CacheExeption catch (e) {
        return left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
