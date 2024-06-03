import 'package:news_flutter_app/data/models/news_model.dart';

abstract class NewsStates {}

class InitialNewsState extends NewsStates {}

class LoadingNewsState extends NewsStates {}

class FailureNewsState extends NewsStates {}

class SuccessNewsState extends NewsStates {
  final NewsModel news;

  SuccessNewsState({required this.news});
}

class ChangeModeState extends NewsStates {}
