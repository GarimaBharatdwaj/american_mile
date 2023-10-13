import 'dart:convert';
import 'dart:io';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:dio/dio.dart' as dio;

import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/app_bottomsheet.dart';
import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:american_mile/core/network/api_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileController extends GetxController {
  RxBool isLoading = false.obs;
  Map<String, dynamic>? userData;
  String? userId;

  var formKey = GlobalKey<FormState>();

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  getUserProfile() async {
    userId = DeviceHelper.getId();

    debugPrint(userId.toString());
    isLoading.value = true;
    try {
      var response = await API().post('get-profile', data: {
        'user_id': int.parse(userId!),
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        userData = mapData['user_data'];
        fullName.text = userData!['fullname'] ?? "";
        email.text = userData!['email'] ?? "";
        phone.text = userData!['mobile'] ?? "";
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
    isLoading.value = false;
  }

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
      File file = File(path);
      updateUserDetails(file: file);
    }
  }


  void validateMethode() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      // updateUserDetails();
    }
    formKey.currentState!.save();
  }

  updateUserDetails({File? file}) async {
    final Map<String, dynamic> data = {
      'user_id': int.parse(userId!),
      'fullname': fullName.text,
      'email': email.text,
      'mobile': phone.text,
    };

    if (file != null) {
      data['image'] = await dio.MultipartFile.fromFile(file.path);
    }

    isLoading.value = true;
    final apiResult = await API().postData(
      endPoint: 'update-profile',
      data: data,
    );

    if (apiResult is ApiSuccess) {
      final result = apiResult.data;

      if (result['status'] == 1) {
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
}
