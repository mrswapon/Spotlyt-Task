import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/models/requester_task_model.dart';
import '../../services/api_checker.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';
import '../../utils/app_constant.dart';

class RequesterTaskController extends GetxController {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  int page = 1;
  var isFirstLoadRunning = false.obs;
  var isLoadMoreRunning = false.obs;
  var totalPage = (-1);
  var currentPage = (-1);

  var selectTab = "pending".obs;

  RxList<RequesterTaskModel> taskList = <RequesterTaskModel>[].obs;

  refreshLoad() async {
    page = 1;
    Response response = await ApiClient.getData(
      ApiConstants.requesterTaskApi(selectTab.value, page.toString()),
    );
    if (response.statusCode == 200) {
      currentPage = response.body['data']['attributes']['page'];
      totalPage = response.body['data']['attributes']['totalPages'];
      taskList.value = List<RequesterTaskModel>.from(response.body['data']
              ['attributes']['results']
          .map((x) => RequesterTaskModel.fromJson(x)));
    } else if (response.statusCode == 404) {
      taskList.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  fastLoad() async {
    page = 1;
    isFirstLoadRunning(true);
    Response response = await ApiClient.getData(
      ApiConstants.requesterTaskApi(selectTab.value, page.toString()),
    );
    if (response.statusCode == 200) {
      currentPage = response.body['data']['attributes']['page'];
      totalPage = response.body['data']['attributes']['totalPages'];
      taskList.value = List<RequesterTaskModel>.from(response.body['data']
              ['attributes']['results']
          .map((x) => RequesterTaskModel.fromJson(x)));
      taskList.refresh();
      isFirstLoadRunning(false);
    } else if (response.statusCode == 404) {
      taskList.refresh();
      isFirstLoadRunning(false);
    } else {
      isFirstLoadRunning(false);
      ApiChecker.checkApi(response);
    }
  }

  loadMore() async {
    debugPrint("========> load more");
    if (isFirstLoadRunning.value != true &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page += 1;
      Response response = await ApiClient.getData(
        ApiConstants.requesterTaskApi(selectTab.value, page.toString()),
      );
      currentPage = currentPage = response.body['data']['attributes']['page'];
      totalPage = response.body['data']['attributes']['totalPages'];
      if (response.statusCode == 200) {
        var demoList = List<RequesterTaskModel>.from(response.body['data']
                ['attributes']['results']
            .map((x) => RequesterTaskModel.fromJson(x)));
        taskList.addAll(demoList);
        taskList.refresh();
        isLoadMoreRunning(false);
      } else {
        ApiChecker.checkApi(response);
        isLoadMoreRunning(false);
      }
    }
  }
}
