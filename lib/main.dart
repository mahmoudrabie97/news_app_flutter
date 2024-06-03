import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/core/databases/cache/cache_helper.dart';
import 'package:news_flutter_app/core/theme/dark_theme.dart';
import 'package:news_flutter_app/core/theme/light_theme.dart';
import 'package:news_flutter_app/presentation/cubit/newscubit.dart';
import 'package:news_flutter_app/presentation/cubit/newsstates.dart';
import 'package:news_flutter_app/presentation/screens/news_listing_screen/news_listing_screen.dart';
import 'package:news_flutter_app/simpleblocobserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..eitherFailureorNews()
        ..loadThemeMode(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.deepOrange,
                    scaffoldBackgroundColor: Colors.white,
                  ),
                  darkTheme: darkTheme,
                  themeMode: NewsCubit.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home: NewsListingScreen());
            },
          );
        },
      ),
    );
  }
}
