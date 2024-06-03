import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/core/connection/network_info.dart';
import 'package:news_flutter_app/core/databases/api/dio_consumer.dart';
import 'package:news_flutter_app/core/databases/cache/cache_helper.dart';
import 'package:news_flutter_app/data/datasource/news_local_data_source.dart';
import 'package:news_flutter_app/data/datasource/news_remote_datasource.dart';
import 'package:news_flutter_app/data/models/news_model.dart';
import 'package:news_flutter_app/data/repositres/news_repsitry_implemntion.dart';
import 'package:news_flutter_app/domain/usecases/get_user.dart';
import 'package:news_flutter_app/presentation/cubit/newsstates.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super((InitialNewsState()));
  static NewsCubit get(context) => BlocProvider.of(context);
  NewsModel? newsmodel;

  eitherFailureorNews() async {
    emit(LoadingNewsState());
    final failureornews = await GetNews(
            repsitry: NewsRepoImplement(
                remoteDatasource:
                    NewsRemoteDatasource(api: DioConsumer(dio: Dio())),
                localDataSource: NewsLocalDataSource(cache: CacheHelper()),
                networkInfo: NetworkInfoImpl(DataConnectionChecker())))
        .call();
    failureornews.fold(
      (failure) => emit(FailureNewsState()),
      (news) {
        newsmodel = news;
        print('news${newsmodel!.articles!.length}');
        emit(SuccessNewsState(news: news));
      },
    );
  }

  bool isDark = false;
  Future<void> changeAppMode() async {
    isDark = !isDark;
    await CacheHelper.saveThemeMode(isDark);
    loadThemeMode();
    emit(ChangeModeState());
  }

  Future<void> loadThemeMode() async {
    isDark = await CacheHelper.getThemeMode();
  }
}
