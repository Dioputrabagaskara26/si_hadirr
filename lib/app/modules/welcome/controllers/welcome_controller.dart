import 'package:get/get.dart';
import 'package:si_hadirr/app/routes/app_pages.dart';
class WelcomeController extends GetxController {
  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  void goToSignUp() {
    Get.toNamed(AppRoutes.signup);
  }
}
