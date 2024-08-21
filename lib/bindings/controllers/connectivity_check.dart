import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityCheck extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var txt = TextFond();
  var use = ReusableClass();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectresult) {
    if (connectresult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: txt.textWidget(
            'Please connect to internet', 12.0, FontWeight.w500, cWhite),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.red,
        icon: use.svgOffline(StaticData.internet, 20.0, 20.0, cWhite),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
