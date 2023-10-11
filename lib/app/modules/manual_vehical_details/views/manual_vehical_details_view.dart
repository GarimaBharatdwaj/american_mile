import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/primary_button.dart';
import 'package:american_mile/core/utils/app_colors.dart';
import 'package:american_mile/core/utils/index.dart';
import '../../../../core/components/index.dart';
import '../controllers/manual_vehical_details_controller.dart';

class ManualVehicalDetailsView extends GetView<ManualVehicalDetailsController> {
  const ManualVehicalDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(
                title: 'Manually Detail',
              ),

              Gap(30.h),
              _yearComponent(context),
              Gap(20.h),
              _makeComponent(context),
              Gap(20.h),
              _modelComponent(context),
              Gap(20.h),
              _payTypeComponent(context),
              Gap(20.h),
              _carComponent(context),
              Gap(20.h),
              _driverComponent(context),
              Gap(20.h),
              _driverPayTypeComponent(context),
              Gap(20.h),
              _driverAmountComponent(context),
              Gap(20.h),

              _reviewComponent(context),
              PrimaryButton(
                buttonText: "Flow",
                onTap: () {
                  Get.toNamed(Routes.CHECK_OFFER);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _yearComponent(BuildContext context) {
    return Column(
      children: [
        _containerWidget(
          title: "Select Year",
        ),
        Gap(28.h),
        Wrap(
          runSpacing: 18.w,
          spacing: 18.w,
          children: List.generate(controller.yaerList.length, (index) {
            return _textPill(
              context,
              controller.yaerList[index],
            );
          }),
        ),
      ],
    );
  }

  _carComponent(BuildContext context) {
    return Column(
      children: [
        BorderContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImagePaths.carSlide,
                height: 32.h,
                width: 48.w,
              ),
              Gap(8.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Aston Martin DB11",
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  Text(
                    "Edit",
                    style: Get.textTheme.titleLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  Gap(4.w),
                  Image.asset(
                    ImagePaths.right,
                    width: 10.w,
                  ),
                ],
              ),
              Gap(10.h),
              Text(
                "2020 - V8",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
        Gap(20.h),
        BorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 20.w,
              ),
              Text(
                "Add a vehicle",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _payTypeComponent(BuildContext context) {
    return Column(
      children: [
        _containerWidget(
          title: "Owned - paid is full",
          showIcon: false,
        ),
        Gap(28.h),
        _containerWidget(
          title: "Owned - still paying",
          showIcon: false,
        ),
        Gap(28.h),
        _containerWidget(
          title: "Leased",
          showIcon: false,
        ),
      ],
    );
  }

  _makeComponent(BuildContext context) {
    return Column(
      children: [
        _containerWidget(
          title: "Select Make",
        ),
        Gap(28.h),
        Wrap(
          runSpacing: 18.w,
          spacing: context.width * .05,
          children: List.generate(controller.makeList.length, (index) {
            return _textPill(
              context,
              controller.makeList[index],
            );
          }),
        ),
      ],
    );
  }

  _modelComponent(BuildContext context) {
    return Column(
      children: [
        _containerWidget(
          title: "Select Model",
        ),
        Gap(28.h),
        Wrap(
          runSpacing: 18.w,
          spacing: context.width * .05,
          children: List.generate(controller.modelList.length, (index) {
            return _textPill(
              context,
              controller.modelList[index],
            );
          }),
        ),
      ],
    );
  }

  _textPill(BuildContext context, String year) {
    return Container(
      alignment: Alignment.center,
      width: context.width * .26,
      padding: EdgeInsets.symmetric(
        vertical: 9.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(
          width: 1.w,
          color: AppColors.black.withOpacity(.8),
        ),
      ),
      child: Text(
        year,
        style: Get.textTheme.bodySmall?.copyWith(
          fontSize: 10.sp,
        ),
      ),
    );
  }

  _containerWidget({
    required String title,
    bool showIcon = true,
  }) {
    return BorderContainer(
      child: Row(
        mainAxisAlignment: showIcon
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Get.textTheme.titleLarge,
          ),
          if (showIcon)
            Icon(
              Icons.arrow_downward,
              size: 25.w,
            ),
        ],
      ),
    );
  }

  _driverComponent(BuildContext context) {
    return Column(
      children: [
        LoginTextField(
          hintText: "Enter First Name",
          labelText: "First Name",
          controller: TextEditingController(text: "Adam"),
        ),
        Gap(24.h),
        LoginTextField(
          hintText: "Enter Last Name",
          labelText: "Last Name",
          controller: TextEditingController(text: 'Adam Robbins'),
        ),
        Gap(24.h),
        LoginTextField(
          hintText: "Enter Date Of Birth",
          labelText: "Date Of Birth",
          controller: TextEditingController(text: 'mm/dd/yyyy'),
        ),
        Gap(24.h),
        Row(
          children: [
            Expanded(
              child: driverPill(
                'Male',
              ),
            ),
            Gap(20.w),
            Expanded(
              child: driverPill(
                'Female',
              ),
            ),
            Gap(20.w),
            Expanded(
              child: driverPill(
                'Female',
              ),
            ),
          ],
        ),
        Gap(12.h),
        Row(
          children: [
            Expanded(
              child: driverPill(
                'Single',
              ),
            ),
            Gap(20.w),
            Expanded(
              child: driverPill(
                'Married',
              ),
            ),
          ],
        ),
      ],
    );
  }

  driverPill(String text) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(
        20.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1.w,
            color: AppColors.borderColor,
          ),
          color: AppColors.white),
      child: Text(
        text,
        style: Get.textTheme.titleMedium,
      ),
    );
  }

  _driverPayTypeComponent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How often are you paying for auto insurance?",
          style: Get.textTheme.titleSmall,
        ),
        Gap(20.h),
        _containerWidget(
          title: "I pay monthly",
          showIcon: false,
        ),
        Gap(28.h),
        _containerWidget(
          title: "I pay every 6 months",
          showIcon: false,
        ),
        Gap(28.h),
        _containerWidget(
          title: "I Pay every year",
          showIcon: false,
        ),
      ],
    );
  }

  _driverAmountComponent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How much are you paying for auto insurance every month?",
          style: Get.textTheme.titleSmall,
        ),
        Gap(20.h),
        Text(
          "If you don't know the exact amount, an estimate is okay!",
          style: Get.textTheme.titleSmall,
        ),
        Gap(20.h),
        _containerWidget(
          title: "\$300",
          showIcon: false,
        ),
        Gap(28.h),
      ],
    );
  }

  _reviewComponent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Review your Auto Policy Profile",
          style: Get.textTheme.titleSmall,
        ),
        Gap(20.h),
        _reviewPolicyComponent(
          context,
          title: "Policy",
          name: "Jack Marvel",
          subTitle: "Farmers Market Place Los\nAngeles, CA 90036",
          icon: ImagePaths.userAlt,
        ),
        Gap(20.h),
        _reviewPolicyComponent(
          context,
          title: "Vehicles",
          name: "Aston Martin DB11",
          subTitle: "2020 - V8",
          icon: ImagePaths.carSlide,
        ),
        Gap(20.h),
        _reviewPolicyComponent(
          context,
          title: "Driver",
          name: "Jack Marvel",
          subTitle: "Male . 30",
          icon: ImagePaths.userAlt,
        ),
        Gap(20.h),
      ],
    );
  }

  _reviewPolicyComponent(
    BuildContext context, {
    required String title,
    required String name,
    required String subTitle,
    required String icon,
  }) {
    return BorderContainer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Get.textTheme.titleLarge?.copyWith(
                    fontSize: 24.sp,
                  ),
                ),
              ),
              Text(
                "Edit",
                style: Get.textTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              Gap(6.w),
              Image.asset(
                ImagePaths.right,
                width: 10.w,
              ),
            ],
          ),
          Gap(20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                icon,
                width: 25.w,
                height: 25.w,
              ),
              Gap(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    Gap(6.h),
                    Text(
                      subTitle,
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 18.sp,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
