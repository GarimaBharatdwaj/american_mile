import 'dart:convert';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:american_mile/app/ui/widgets/view_document.dart';
import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:get/get.dart';
import '../../../../core/network/api_service.dart';

class HomePolicyController extends GetxController {
  
  RxInt type = 0.obs;
  String policyId = "";

  @override
  void onInit() {
    policyId = Get.arguments;
    homePolicyAPI();
    super.onInit();
  }
  //
  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? homeDetails;
  homePolicyAPI() {
    isLoading.value = true;
    API().post(
      "coverage-homeowners",
      data: {
        'user_id': DeviceHelper.getUserId(),
        'home_policy_id': policyId,
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            homeDetails = res['data'];
          } else {
            errorDialog(res['msg']);
          }
        } else {
          errorDialog("Some error occurred");
        }
      } catch (e) {
        errorDialog("Some error occurred");
      }
      isLoading.value = false;
    });
  }

  viewDocumentAPI(String docID) {
    isLoading.value = true;
    API().post(
      "get-document-data",
      data: {
        'document_id': docID,
        'user_id': DeviceHelper.getUserId(),
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            isLoading.value = false;
            Get.to(() => ViewDocument(url: res['docfile']));
          } else {
            isLoading.value = false;
            errorDialog(res['msg']);
          }
        } else {
          isLoading.value = false;
          errorDialog("Some error occurred");
        }
      } catch (e) {
        isLoading.value = false;
        errorDialog("Some error occurred");
      }
      isLoading.value = false;
    });
  }
}
