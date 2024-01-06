import 'package:american_mile/app/modules/auto_policy/controllers/auto_policy_controller.dart';
import 'package:american_mile/app/modules/home/controllers/home_controller.dart';
import 'package:american_mile/app/modules/my_family/controllers/my_family_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../common_lib.dart';
import '../controllers/car_dashboard_controller.dart';

class CarDashBoardWebView extends StatefulWidget {
  const CarDashBoardWebView({
    super.key,
    required this.webUrl,

    ///required this.type,
  });

  final String webUrl;
  ///final String type;

  @override
  State<CarDashBoardWebView> createState() => _CarDashBoardWebViewState();
}

class _CarDashBoardWebViewState extends State<CarDashBoardWebView> {
  late final WebViewController _controller;

  final CarDashboardController carDashboardController =
      Get.find<CarDashboardController>();

  whenCarConnected(url) {
    if (url.contains(carDashboardController.thankYouUrl) ||
        url.contains(carDashboardController.thankYouUrlTwo)) {
      // if (widget.type == "1") {
      //   final AutoPolicyController myFamilyController =
      //        Get.find<AutoPolicyController>();
      //    myFamilyController.autoPolicyAPI();
      //    Get.back();
      //  }
       //else if (widget.type == "2") {
      //   final HomeController myFamilyController = Get.find<HomeController>();
      //   myFamilyController.myFamilyAPI();
      //   Get.back();
      // } else {
      //   final MyFamilyController myFamilyController =
      //       Get.find<MyFamilyController>();
      //   myFamilyController.myFamilyAPI();
       //else{
      final CarDashboardController carDashboardController =
          Get.find<CarDashboardController>();
      carDashboardController.getData();
      Get.back();
      //}
    }
  }

  initializeWebView() async {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            whenCarConnected(url);
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.webUrl));
  }

  @override
  void initState() {
    super.initState();
    initializeWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WebViewWidget(controller: _controller));
  }
}
