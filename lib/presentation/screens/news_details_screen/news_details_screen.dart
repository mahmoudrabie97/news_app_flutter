import 'package:flutter/material.dart';
import 'package:news_flutter_app/data/models/news_model.dart';
import 'package:news_flutter_app/presentation/screens/news_details_screen/widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.newsdetails, required this.i});
  final NewsModel? newsdetails;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailsBody(
        newsdetails: newsdetails,
        i: i,
      ),
    );
  }
}
