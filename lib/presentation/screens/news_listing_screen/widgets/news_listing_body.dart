import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/core/databases/cache/cache_helper.dart';
import 'package:news_flutter_app/core/utilites/app_styles.dart';
import 'package:news_flutter_app/presentation/cubit/newscubit.dart';
import 'package:news_flutter_app/presentation/cubit/newsstates.dart';
import 'package:news_flutter_app/presentation/screens/news_listing_screen/widgets/container_image.dart';
import 'package:news_flutter_app/presentation/screens/news_listing_screen/widgets/news_listview_item.dart';

class NewsListingBody extends StatelessWidget {
  const NewsListingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: NewsCubit.get(context).state is LoadingNewsState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsListviewItem(
                      news: NewsCubit.get(context).newsmodel,
                      i: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount:
                      NewsCubit.get(context).newsmodel!.articles!.length),
        );
      },
    );
  }
}
