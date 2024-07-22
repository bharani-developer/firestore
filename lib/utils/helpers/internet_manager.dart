import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:store/utils/popups/loaders.dart';

class NetworkController extends GetxController {
  Connectivity connectivity = Connectivity();
    final Rx<String> connectionStatus = ''.obs;

  @override
  void onInit() {
    connectivity.onConnectivityChanged.listen((event) {});
    super.onInit();
  }

  updateConnectionStatus(List<ConnectivityResult> connectivityResultList) {
    if (connectivityResultList.contains(ConnectivityResult.none)) {
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }
}
