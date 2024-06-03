import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_flutter_app/core/utilites/app_styles.dart';
import 'package:news_flutter_app/core/utilites/extentionhelper.dart';
import 'package:news_flutter_app/data/models/news_model.dart';
import 'package:news_flutter_app/presentation/screens/news_details_screen/news_details_screen.dart';
import 'package:news_flutter_app/presentation/screens/news_listing_screen/widgets/container_image.dart';

class NewsListviewItem extends StatelessWidget {
  const NewsListviewItem({
    super.key,
    required this.news,
    required this.i,
  });
  final NewsModel? news;
  final int i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(DetailsScreen(
          newsdetails: news,
          i: i,
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            ContainerImage(
              image: news!.articles![i].urlToImage ?? '',
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        news!.articles![i].title ?? '',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                            ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            news!.articles![i].source!.name ?? '',
                            style: AppStyles.style16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
