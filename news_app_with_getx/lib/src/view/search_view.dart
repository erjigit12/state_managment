// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/components/new_crd.dart';
import 'package:news_app/src/constants/text.dart';
import 'package:news_app/src/controllers/search_controller.dart';
import 'package:news_app/src/theme/colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final controller = TextEditingController();
  final ctl = Get.put(SearchCtl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        title: TextField(
          controller: controller,
          onSubmitted: (value) async {
            await ctl.fetchdata(value);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await ctl.fetchdata(controller.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Obx(
        () {
          if (ctl.isSearch) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (ctl.isSearch == false && ctl.topNews.value != null) {
            return ListView.builder(
              itemCount: ctl.topNews.value!.articles.length,
              itemBuilder: (context, index) {
                final news = ctl.topNews.value!.articles[index];
                return NewCard(news: news);
              },
            );
          } else {
            return Center(
              child: Text(AppText.searchTitle),
            );
          }
        },
      ),
    );
  }
}
