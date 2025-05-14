import 'package:get/get.dart';
import 'package:si_hadirr/app/routes/app_pages.dart';

class SplashController extends GetxController {
@override
void onInit() {
  super.onInit();
Future.delayed(const Duration(seconds: 2), () {
  Get.offAllNamed(AppRoutes.welcome); // bukan langsung ke login lagi
});
}
}