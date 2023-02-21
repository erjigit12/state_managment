import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/components/new_crd.dart';
import 'package:news_app/src/constants/county.dart';
import 'package:news_app/src/constants/text.dart';
import 'package:news_app/src/controllers/fetch_controller.dart';
import 'package:news_app/src/theme/colors.dart';
import 'package:news_app/src/view/search_view.dart';

class ViewPage extends StatelessWidget {
  ViewPage({super.key});
  final ctl = Get.put(FetchCtl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        title: const Text(AppText.appBarText),
        actions: [
          PopupMenuButton(
            onSelected: (Country item) async {
              await ctl.fetchNews(item.domain);
            },
            itemBuilder: (context) {
              return countrySet
                  .map(
                    (e) => PopupMenuItem<Country>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: Obx(
        () {
          return ctl.topNews.value == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: ctl.topNews.value!.articles.length,
                  itemBuilder: (context, index) {
                    final news = ctl.topNews.value!.articles[index];
                    return NewCard(news: news);
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchView(),
              ));
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
