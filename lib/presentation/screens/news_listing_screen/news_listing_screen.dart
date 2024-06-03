import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_flutter_app/core/utilites/app_styles.dart';
import 'package:news_flutter_app/presentation/cubit/newscubit.dart';
import 'package:news_flutter_app/presentation/screens/news_listing_screen/widgets/news_listing_body.dart';

class NewsListingScreen extends StatelessWidget {
  const NewsListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 30),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              NewsCubit.get(context).changeAppMode();
            },
            child: Row(
              children: [
                Text(
                  NewsCubit.get(context).isDark ? 'Light Mode' : 'Dark Mode',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                    onPressed: () {
                      NewsCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4)),
              ],
            ),
          )
        ],
      ),
      body: const NewsListingBody(),
    );
  }
}
