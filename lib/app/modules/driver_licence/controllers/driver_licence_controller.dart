import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:american_mile/core/network/api_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/app_bottomsheet.dart';
import '../../../../core/helpers/device_helper.dart';

class DriverLicenceController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    /// scanDriverDetails();
  }

  //***********************************************************************//
  //****************** Scan Driver's License ******************************//
  //***********************************************************************//

  Map<String, dynamic>? driverDetails;

  scanDriverDetails() async {
    isLoading.value = true;
    try {
      var response = await API().post('scan-license', data: {
        'base64_image': base64,
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'].toString() == "1") {
          driverDetails = mapData;
          debugPrint(mapData['msg']);
          sendArgumentsToDriverDetails(
            isAddingManually: false,
          );
          isLoading.value = false;
        } else {
          isLoading.value = false;
          errorDialog(mapData['msg']);
        }
      } else {
        isLoading.value = false;
        errorDialog("Something went wrong, Please try again later");
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }

  sendArgumentsToDriverDetails({
    required bool isAddingManually,
  }) {
    Get.toNamed(
      Routes.DRIVER_DETAILS,
      arguments: isAddingManually == true
          ? null
          : {
              'isAddingManually': isAddingManually,
              'driverId': '',
              'edit': false,
              'name': driverDetails!['details']['name'] ?? '',
              'gender': driverDetails!['details']['gender'] ?? '',
              'dob': driverDetails!['details']['dob'] ?? '',
              'dl': driverDetails!['details']['license_number'] ?? '',
              'address': driverDetails!['details']['address'] ?? ''
            },
    );
  }

//********************************************************************************//
//******************************** Driving Licence *******************************//
//********************************************************************************//

  String base64 = "";
  void onDrivingLicenceTap(BuildContext context) {
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
          initAspectRatio: CropAspectRatioPreset.ratio3x2,
        ),
      ],
    );

    if (cropped != null) {
      final path = cropped.path;
      Uint8List bytes = File(path).readAsBytesSync();
      String base64Image = base64Encode(bytes);
      base64 = base64Image;
      scanDriverDetails();
    }
  }
}
