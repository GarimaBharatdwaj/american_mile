import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

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
                      "Details",
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
                hintText: "Enter Name",
                labelText: "Name",
                controller: TextEditingController(),
              ),
              Gap(24.h),
              LoginTextField(
                hintText: "Enter Gender",
                labelText: "Gender",
                controller: TextEditingController(),
              ),
              Gap(24.h),
              LoginTextField(
                hintText: "Enter Date Of Birth",
                labelText: "Date Of Birth",
                controller: TextEditingController(),
              ),
              Gap(24.h),
              LoginTextField(
                hintText: "Enter Driver's License Number",
                labelText: "Driver's License Number",
                controller: TextEditingController(),
              ),
              Gap(24.h),
              LoginTextField(
                hintText: "Enter Address",
                labelText: "Address",
                controller: TextEditingController(),
              ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.all(30.w),
                child: PrimaryButton(
                  buttonText: "Yes, It's Correct",
                  onTap: () {
                    Get.toNamed(Routes.SEARCH_BY_VIN);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: PrimaryButton(
                  backgroundColor: AppColors.textBlackColor,
                  buttonText: "No, I need to Change",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
