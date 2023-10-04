import 'dart:async';

import 'package:american_mile/common_lib.dart';

class OnboardController extends GetxController {
  late PageController pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.onInit();
  }

  onPageChanged(index) {
    _pageIndex = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    _timer!.cancel();
    super.onClose();
  }
}
