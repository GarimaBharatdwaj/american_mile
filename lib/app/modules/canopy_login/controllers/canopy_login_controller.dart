import '../../../../common_lib.dart';

class CanopyLoginController extends GetxController {
  RxBool isLoading = false.obs;
  String? carrierId;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    carrierId = Get.arguments;
    super.onInit();
  }
}
