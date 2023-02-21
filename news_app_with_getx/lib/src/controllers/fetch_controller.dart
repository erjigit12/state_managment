import 'package:get/get.dart';
import 'package:news_app/src/model/copy_model.dart';
import 'package:news_app/src/service/fetch_service.dart';

class FetchCtl extends GetxController {
  Rx<TopNews?> topNews = Rxn();
  Future<void> fetchNews([String? domain]) async {
    topNews.value = await NewsRepo().fetchNews(domain);
  }

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }
}
