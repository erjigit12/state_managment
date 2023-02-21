import 'package:get/get.dart';
import 'package:news_app/src/model/copy_model.dart';
import 'package:news_app/src/service/fetch_service.dart';

class SearchCtl extends GetxController {
  Rx<TopNews?> topNews = Rxn();
  bool isSearch = false;

  Future<void> fetchdata(String text) async {
    isSearch = true;

    topNews.value = await NewsRepo().fetchSearchNews(text);
    isSearch = false;
  }
}
