import 'package:american_mile/app/modules/driver_licence/component/driver_details.dart';
import 'package:american_mile/common_lib.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/components/rect_icon.dart';
import '../../../../core/utils/index.dart';
import '../controllers/driver_licence_controller.dart';

class DriverLicenceView extends GetView<DriverLicenceController> {
  const DriverLicenceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              Row(
                children: [
                  RRectIcon(
                    image: ImagePaths.arrow,
                    onTap: () {},
                  ),
                  Expanded(
                    child: Text(
                      "Driver's License",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: RRectIcon(
                      image: ImagePaths.menu,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              Image.asset(
                ImagePaths.licence,
              ),
              Gap(20.h),
              Text(
                "01 Turn your Driver's License Over",
                style: Get.textTheme.titleLarge?.copyWith(fontSize: 18.sp),
              ),
              Gap(12.h),
              Text(
                "02 Scan the Barcode",
                style: Get.textTheme.titleLarge?.copyWith(fontSize: 18.sp),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 50.w, right: 50.w, top: 24.h, bottom: 12.h),
                child: PrimaryButton(
                  buttonText: "Ready to Scan",
                  onTap: () {
                    controller.isAddingManually.value = false;
                    Get.to(
                      () => DriverDetails(),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w, right: 50.w, bottom: 24.h),
                child: PrimaryButton(
                  buttonText: "Add Manually",
                  onTap: () {
                    controller.isAddingManually.value = true;
                    Get.to(
                      () => DriverDetails(),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account? ",
                    style: Get.textTheme.titleLarge?.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "SIGN IN",
                    style: Get.textTheme.titleLarge?.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
