import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/car_details_controller.dart';

class VehicleDetails extends GetView<CarDetailsController> {
  const VehicleDetails({Key? key}) : super(key: key);
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
                      "Vehicle Details",
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
              Gap(40.h),
              LoginTextField(
                hintText: "Enter VIN",
                labelText: "VIN",
                controller: controller.vinController,
              ),
              Gap(24.h),
              LoginTextField(
                  hintText: "Enter Year",
                  labelText: "Year",
                  controller: controller.yearController),
              Gap(24.h),
              LoginTextField(
                  hintText: "Enter Make",
                  labelText: "Make",
                  controller: controller.makeController),
              Gap(24.h),
              LoginTextField(
                  hintText: "Enter Model",
                  labelText: "Model",
                  controller: controller.modelController),
              Gap(24.h),
              LoginTextField(
                  hintText: "Enter Body Class",
                  labelText: "Body Class",
                  controller: controller.bodyController),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: PrimaryButton(
                  buttonText: "Check Info",
                  onTap: () {
                    Get.toNamed(Routes.POLICY_DASHBOARD);
                  },
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: PrimaryButton(
                  buttonText: "Get Quotes",
                  backgroundColor: AppColors.textBlackColor,
                  onTap: () {
                    Get.toNamed(Routes.POLICY_DASHBOARD);
                  },
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: PrimaryButton(
                  buttonText: "I want to change the Vehicle",
                  backgroundColor: AppColors.textBlackColor,
                  onTap: () {
                    Get.toNamed(Routes.POLICY_DASHBOARD);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
