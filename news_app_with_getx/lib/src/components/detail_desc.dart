import 'package:flutter/material.dart';
import 'package:news_app/src/model/copy_model.dart';
import 'package:news_app/src/theme/colors.dart';

class NewsDetailDesc extends StatelessWidget {
  const NewsDetailDesc({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        '${news.description}',
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
