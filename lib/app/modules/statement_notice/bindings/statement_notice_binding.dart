import 'package:get/get.dart';

import '../controllers/statement_notice_controller.dart';

class StatementNoticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatementNoticeController>(
      () => StatementNoticeController(),
    );
  }
}
