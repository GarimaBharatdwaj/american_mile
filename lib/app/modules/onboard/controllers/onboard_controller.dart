import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/helpers/device_helper.dart';

class OnboardController extends GetxController {
  late PageController pageController;
  late PageController pageControllerTwo;
  int _pageIndex = 0;
  RxBool isLastPage = false.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    pageControllerTwo = PageController(initialPage: 0);
    super.onInit();
  }

  onNextPage() {
    if (_pageIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
      pageControllerTwo.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
      isLastPage.value = _pageIndex == 1;
    } else {
      DeviceHelper.saveOnBoard("1");
      Get.offAllNamed(Routes.HOME);
    }
  }

  onPageChanged(index) {
    _pageIndex = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    pageControllerTwo.dispose();
    super.onClose();
  }
}
