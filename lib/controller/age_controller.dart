import 'package:get/get.dart';
import 'package:practical_interview/repository/age_repository.dart';

import '../model/model_age_response.dart';


class AgeController extends GetxController {
  Rx<ModelAgeResponse> model = ModelAgeResponse().obs;
  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }
  getData(){
    ageData(Get.context).then((value) {
      isDataLoading.value = true;
      model.value = value;
      return null;
    });
  }

}