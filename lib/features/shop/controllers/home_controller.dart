import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final carosalCurrentindex = 0.obs;

  void updataPageIndicator(index) {
    carosalCurrentindex.value = index;
  }
}
