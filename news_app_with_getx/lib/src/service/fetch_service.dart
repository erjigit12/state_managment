import 'package:get/get.dart';
import 'package:news_app/src/constants/api.dart';
import 'package:news_app/src/model/copy_model.dart';

class NewsRepo extends GetConnect {
  Future<TopNews?> fetchNews([String? domain]) async {
    final response = await get(ApiConst.topNews(domain));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body;

      final topNews = TopNews.fromJson(data);
      return topNews;
    }
    return null;
  }

  Future<TopNews?> fetchSearchNews(String text) async {
    final response = await get(ApiConst.searchNews(text));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body;

      final topNews = TopNews.fromJson(data);
      return topNews;
    }
    return null;
  }
}
