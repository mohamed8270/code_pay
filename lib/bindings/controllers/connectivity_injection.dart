import 'package:code_pay/bindings/controllers/connectivity_check.dart';
import 'package:get/get.dart';

class NetworkInjection {
  static void init() {
    Get.put<ConnectivityCheck>(ConnectivityCheck(), permanent: true);
  }
}
