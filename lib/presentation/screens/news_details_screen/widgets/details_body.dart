import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/core/utilites/app_styles.dart';
import 'package:news_flutter_app/data/models/news_model.dart';
import 'package:news_flutter_app/presentation/screens/news_details_screen/widgets/container_image_details.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.newsdetails,
    required this.i,
  });
  final NewsModel? newsdetails;
  final int i;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerImage(
            image: newsdetails!.articles![i].urlToImage ?? '',
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            newsdetails!.articles![i].title ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              newsdetails!.articles![i].content ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text('Publish at: ${newsdetails!.articles![i].publishedAt} ',
              style: AppStyles.style16),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              'Source: ${newsdetails!.articles![i].source!.name}',
              style: AppStyles.style16,
            ),
          ),
        ],
      ),
    ));
  }
}
