import 'dart:convert';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:dio/dio.dart' as dio;
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/app_bottomsheet.dart';
import 'package:american_mile/core/network/api_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/helpers/device_helper.dart';

class UserProfileController extends GetxController {
  String? userId;
  RxBool edit = false.obs;
  bool isBack = false;
  var formKey = GlobalKey<FormState>();

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    userId = DeviceHelper.getUserId();
    getUserProfile();
  }


  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? userData;
  getUserProfile() {
    isLoading.value = true;
    API().post(
      "get-profile",
      data: {
        'user_id': DeviceHelper.getUserId(), //DeviceHelper.getId()
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            profileImagePath.value = "";
            userData = res['user_data'];
            fullName.text = userData!['fullname'] ?? "";
            email.text = userData!['email'] ?? "";
            phone.text = userData!['mobile'] ?? "";
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
  updateUserDetails() async {
    final Map<String, dynamic> data = {
      'user_id': DeviceHelper.getUserId(),
      'fullname': fullName.text,
      'email': email.text,
      'mobile': phone.text,
    };
    data['image'] = await dio.MultipartFile.fromFile(profileImagePath.value);
    isLoading.value = true;
    final apiResult = await API().postData(
      endPoint: 'update-profile',
      data: data,
    );
    if (apiResult is ApiSuccess) {
      final result = apiResult.data;
      if (result['status'] == 1) {
        getUserProfile();
        isBack = true;
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
}
