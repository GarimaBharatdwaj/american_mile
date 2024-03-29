import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/app_bottomsheet.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';
import 'package:dio/dio.dart' as dio;
import '../../../ui/widgets/error_dialog.dart';

class HomeController extends GetxController {
  var isErrorOccured = false.obs;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  RxInt type = 0.obs;

  String? arguments;
  @override
  void onInit() {
    type.value = 0;
    if (DeviceHelper.getUserId() != null && arguments == null) {
      policiesAPI();

      arguments = Get.arguments;

      ///getUserProfile();
    }
    super.onInit();
  }

  getMyCarsData() async {
    isMyFamily.value = true;
    await myFamilyAPI();
    await getRestoreVehicleListAPI();
  }

  setNavThroughArg() {
    Future.delayed(const Duration(seconds: 0), () {
      if (arguments == "auto") {
        toggleFamily(2);
      }
      else if (arguments == "home") {
        toggleFamily(3);
      } else {
        toggleFamily(3);
      }
    });
  }

  deleteDriverAPI(String driverId) {
    isLoading.value = true;
    API().post(
      "delete-driver",
      data: {
        'user_id': DeviceHelper.getUserId(),
        "driver_id": driverId,
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            myFamilyAPI();
          } else {
            isLoading.value = false;
          }
        } else {
          isLoading.value = false;
        }
      } catch (e) {
        isLoading.value = false;
      }
    });
  }

  String getAppBarName() {
    String name = "";
    if (bottomNavIndex.value == 0) {
      name = "Dashboard";
    }
    if (bottomNavIndex.value == 1) {
      name = "Navigation";
    }
    if (bottomNavIndex.value == 2) {
      name = "My Cars";
    }
    if (bottomNavIndex.value == 3) {
      name = "Profile";
    }

    return name;
  }

  var otherPolicyList = [
    {"name": "Boat Insurance", "details": "Details here..."},
    {"name": "Specialty Vehicle Insurance", "details": "Details here..."},
    {"name": "Motorcycle Insurance", "details": "Details here..."}
  ];

  //*********************************************************************//
  //************************* Delete Policies API ***********************//
  //*********************************************************************//

  Future<void> deleteAPI({required String apiName, id}) async {
    isPoliciesLoading.value = true;
    try {
      var response = await API().post(
        apiName,
        data: {'user_id': DeviceHelper.getUserId(), 'id': id},
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'] == 1) {
          await policiesAPI();
        } else {
          errorDialog(res['msg']);
        }
      } else {
        errorDialog('Some error occurred');
      }
    } catch (e) {
      errorDialog('Some error occurred');
    }
  }

  // deleteAPI({required String apiName, id}) {
  //   isPoliciesLoading.value = true;
  //   API().post(
  //     apiName,
  //     data: {'user_id': DeviceHelper.getUserId(), 'id': id},
  //   ).then((value) async {
  //     Get.log("Value  :  $value");
  //     try {
  //       Map<String, dynamic>? res = json.decode(value.data);
  //       policiesAPI();
  //       if (res != null) {
  //         if (res['status'] == 1) {
  //
  //         } else {
  //           errorDialog(res['msg']);
  //         }
  //       } else {
  //         errorDialog('Some error occurred');
  //       }
  //     } catch (e) {
  //       errorDialog('Some error occurred');
  //     }
  //     isPoliciesLoading.value = false;
  //   });
  // }

  //*********************************************************************//
  //************************* User Policies API *************************//
  //*********************************************************************//

  RxBool isPoliciesLoading = false.obs;
  Map<String, dynamic>? policies;
  policiesAPI() {
    isPoliciesLoading.value = true;

    API().post(
      "policy-dashboard",
      data: {
        'user_id': DeviceHelper.getUserId(),
      },
    ).then((value) async {
      try {
        Get.log("Value  :  $value");
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            policies = res;
            isPoliciesLoading.value = false;
          } else {
            errorDialog(res['msg']);
          }
        } else {
          errorDialog('Some error occurred');
        }
      } catch (e) {
        errorDialog('Some error occurred');
      }
      isPoliciesLoading.value = false;
    }).catchError((error) {
      isPoliciesLoading.value = false;
      if (kDebugMode) {
        print(error);
      }
    });

    // API().post(
    //   "policy-dashboard",
    //   data: {
    //     'user_id': DeviceHelper.getUserId(),
    //   },
    // ).then((value) async {
    //   Get.log("Value  :  $value");
    //   try {
    //     Map<String, dynamic>? res = json.decode(value.data);
    //     if (res != null) {
    //       if (res['status'].toString() == "1") {
    //         policies = res;
    //         isPoliciesLoading.value = false;
    //       } else {
    //         errorDialog(res['msg']);
    //       }
    //     } else {
    //       errorDialog('Some error occurred');
    //     }
    //   } catch (e) {
    //     errorDialog('Some error occurred');
    //   }
    //   isPoliciesLoading.value = false;
    // });
  }

  //*********************************************************************//
  //************************* User Profile code *************************//
  //*********************************************************************//

  var formKey = GlobalKey<FormState>();

  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? userData;

  Future<void> getUserProfile() async {
    isLoading.value = true;
    try {
      var response = await API().post(
        "get-profile",
        data: {
          'user_id': DeviceHelper.getUserId(),
        },
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'].toString() == "1") {
          profileImagePath.value = "";
          userData = res['user_data'];
          fullName.text = userData!['fullname'] ?? "";
          email.text = userData!['email'] ?? "";
          phone.text = userData!['mobile'] ?? "";
        } else {
          // Constants.showErrorDialogRevise();
        }
      } else {
        // Constants.showErrorDialogRevise();
      }
    } catch (e) {
      // Constants.showErrorDialogRevise();
    } finally {
      isLoading.value = false;
    }
  }

  /// old get user profile
  // getUserProfile() {
  //   isLoading.value = true;
  //   API().post(
  //     "get-profile",
  //     data: {
  //       'user_id': DeviceHelper.getUserId(), //DeviceHelper.getId()
  //     },
  //   ).then((value) async {
  //     Get.log("Value  :  $value");
  //     try {
  //       Map<String, dynamic>? res = json.decode(value.data);
  //       if (res != null) {
  //         if (res['status'].toString() == "1") {
  //           profileImagePath.value = "";
  //           userData = res['user_data'];
  //           fullName.text = userData!['fullname'] ?? "";
  //           email.text = userData!['email'] ?? "";
  //           phone.text = userData!['mobile'] ?? "";
  //         } else {
  //           // Constants.showErrorDialogRevise();
  //         }
  //       } else {
  //         // Constants.showErrorDialogRevise();
  //       }
  //     } catch (e) {
  //       // Constants.showErrorDialogRevise();
  //     }
  //     isLoading.value = false;
  //   });
  // }

  RxBool edit = false.obs;
  RxString profileImagePath = "".obs;
  void onProfileImageTap(BuildContext context) {
    AppBottomSheet.kImagePickerBottomSheet(
      context,
      onCameraTap: () async {
        Get.close(1);
        _pickImage(ImageSource.camera);
      },
      onGalleryTap: () async {
        Get.close(1);
        _pickImage(ImageSource.gallery);
      },
    );
  }

  final ImagePicker _picker = ImagePicker();
  _pickImage(ImageSource source) async {
    XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      _cropImage(image.path);
    }
  }

  _cropImage(String imagePath) async {
    final cropped = await ImageCropper().cropImage(
      sourcePath: imagePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarWidgetColor: Get.theme.scaffoldBackgroundColor,
          toolbarColor: Get.theme.primaryColor,
          lockAspectRatio: true,
          hideBottomControls: true,
          initAspectRatio: CropAspectRatioPreset.square,
        ),
      ],
    );

    if (cropped != null) {
      final path = cropped.path;
      profileImagePath.value = path;
    }
  }

  void validateMethode() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      updateUserDetails();
    }
    formKey.currentState!.save();
  }

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  updateUserDetails() async {
    final Map<String, dynamic> data = {
      'user_id': DeviceHelper.getUserId(),
      'fullname': fullName.text,
      'email': email.text,
      'mobile': phone.text,
    };
    if (profileImagePath.value != "") {
      data['image'] = await dio.MultipartFile.fromFile(profileImagePath.value);
    }
    isLoading.value = true;
    final apiResult = await API().postData(
      endPoint: 'update-profile',
      data: data,
    );
    if (apiResult is ApiSuccess) {
      final result = apiResult.data;
      if (result['status'] == 1) {
        edit.value = false;
        getUserProfile();
      } else {
        isLoading.value = false;
        errorDialog(result['msg']);
      }
    } else if (apiResult is ApiFailure) {
      isLoading.value = false;
      errorDialog(apiResult.message);
    } else {
      isLoading.value = false;
      errorDialog("Some error occurred");
    }
  }

  RxInt bottomNavIndex = 0.obs;
  final iconList = <IconData>[
    Icons.dashboard,
    Icons.location_searching_rounded,
    Icons.drive_eta_outlined,
    Icons.account_circle,
  ];

  onBottomTap(int index) {
    bottomNavIndex.value = index;
    if (index == 0) {
      policiesAPI();

      ///getUserProfile();
    }
    if (index == 2) {
      getMyCarsData();

      ///policiesAPI();
    }

    if (index == 1) {
      getData();
    }
    if (index == 3) {
      getData();
      getUserProfile();
    }
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  /// --------------------------------------------------------------------------

  Future<void> restoreVehicleAPI(String id) async {
    isLoading.value = true;
    try {
      var response = await API().post(
        "add-unlisted-vehicle",
        data: {'user_id': DeviceHelper.getUserId(), 'id': id},
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'] == 1) {
          await getMyCarsData();
        } else {
          errorDialog(res['msg']);
        }
      }
    } catch (e) {
      errorDialog("Some error occurred");
    } finally {
      isLoading.value = false;
    }
  }

  RxBool isMyFamily = false.obs;

  Future<void> getData() async {
    isMyFamily.value = true;
    await myFamilyAPI();

    ///await getRestoreVehicleListAPI();
    debugPrint("DATA NOT FOUND");
  }

  Map<String, dynamic>? familyDetails;

  var restoreVehicleList = [].obs;
  Future<void> getRestoreVehicleListAPI() async {
    isLoading.value = true;
    restoreVehicleList.clear();
    try {
      var response = await API().post(
        "get-driver-package",
        data: {'user_id': DeviceHelper.getUserId()},
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        restoreVehicleList.value = res['unlisted_vehicles'];
        isLoading.value = false;
      }
      isLoading.value = false;
    } catch (e) {
      errorDialog("Some error occurred");
      isLoading.value = false;
    }
  }

  Future<void> deleteVehicleAPI(String vehicleId) async {
    isLoading.value = true;
    try {
      var response = await API().post(
        "delete-vehicle",
        data: {
          'user_id': DeviceHelper.getUserId(),
          'vehicle_id': vehicleId,
        },
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'].toString() == "1") {
          await getData();
        }
      }
    } catch (e) {
      debugPrint("Error in deleteVehicleAPI: $e");
    }
  }

  var active = [
    false,
    false,
    false,
  ].obs;

  toggleFamily(ind) {
    if (ind == 1) {
      active[0] = !active[0];
      active[1] = false;
      active[2] = false;
      return active[0];
    } else if (ind == 2) {
      active[1] = !active[1];
      active[0] = false;
      active[2] = false;
      return active[1];
    } else {
      active[2] = !active[2];
      active[0] = false;
      active[1] = false;
      return active[2];
    }
  }

  Future<void> myFamilyAPI() async {
    familyDetails = null;
    isLoading.value = true;

    try {
      var response = await API().post(
        "my-family",
        data: {'user_id': DeviceHelper.getUserId()},
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'].toString() == "1") {
          familyDetails = res['details'];
          isMyFamily.value = false;
          setNavThroughArg();
        } else {
          errorDialog(res['msg']);
        }
      } else {
        errorDialog("Some error occurred");
      }
    } catch (e) {
      errorDialog("Some error occurred");
    } finally {
      isLoading.value = false;
      isMyFamily.value = false;
    }
  }
}
