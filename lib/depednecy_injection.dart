import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_flutter_app/core/connection/network_info.dart';
import 'package:news_flutter_app/core/databases/api/dio_consumer.dart';
import 'package:news_flutter_app/core/databases/cache/cache_helper.dart';
import 'package:news_flutter_app/data/datasource/news_local_data_source.dart';
import 'package:news_flutter_app/data/datasource/news_remote_datasource.dart';
import 'package:news_flutter_app/data/repositres/news_repsitry_implemntion.dart';
import 'package:news_flutter_app/domain/repositres/news_repositry.dart';
import 'package:news_flutter_app/domain/usecases/get_user.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioConsumer(dio: sl()));

  // Network
  sl.registerLazySingleton<NetworkInfoImpl>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  // Cache
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Remote Data Source
  sl.registerLazySingleton<NewsRemoteDatasource>(
      () => NewsRemoteDatasource(api: sl()));

  // Local Data Source
  sl.registerLazySingleton<NewsLocalDataSource>(
      () => NewsLocalDataSource(cache: sl()));

  // Repository
  sl.registerLazySingleton<NewsRepsitry>(() => NewsRepoImplement(
        remoteDatasource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  // Use Case
  sl.registerLazySingleton(() => GetNews(repsitry: sl()));
}
