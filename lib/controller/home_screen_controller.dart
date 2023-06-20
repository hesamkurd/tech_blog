import 'package:get/get.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_service.dart';

import '../models/poster_model.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastsList = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcastsList.add(PodcastModel.fromJson(element));
      });
    }
  }
}
