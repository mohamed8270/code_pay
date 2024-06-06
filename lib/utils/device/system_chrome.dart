import 'package:code_pay/common/styles/color.dart';
import 'package:flutter/services.dart';

class SystemChromeMethod {
  static systemUImode() {
    return SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }

  static systemUIoverlay() {
    return SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: cGrey2, systemNavigationBarColor: cGrey2),
    );
  }
}
