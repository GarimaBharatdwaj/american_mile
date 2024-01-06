import 'package:american_mile/common_lib.dart';
import '../../../../../core/components/rect_icon.dart';
import '../../../../../core/components/secondry_button.dart';
import '../../../../../core/helpers/image_paths.dart';
import '../../../../../core/utils/app_colors.dart';

class AutoDetails extends StatelessWidget {
  const AutoDetails({super.key, required this.autoDetails});

  final autoDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 5.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RRectIcon(
                      backgroundColor: AppColors.primary.withOpacity(0.2),
                      image: ImagePaths.arrow,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Gap(10.h),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                                radius: 35.h,
                                backgroundColor: Colors.blue,
                                child: CircleAvatar(
                                    radius: 33.h,
                                    foregroundImage: AssetImage(
                                      ImagePaths.userIcon,
                                    ))),
                            Gap(10.h),
                            SizedBox(
                              width: 120.w,
                              child: const Text(
                                'name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Gap(10.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(10.h),
                            SizedBox(
                              width: 120.w,
                              child: const Text(
                                "Driver Details",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 14),
                              ),
                            ),
                            Gap(10.h),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.9,
                                  child: Column(
                                    children: [
                                      _containerItem(
                                        key: "License # :",
                                        value: autoDetails['license_number'],
                                      ),
                                      _containerItem(
                                        key: "Date of Birth :",
                                        value: autoDetails['dob'],
                                      ),
                                      _containerItem(
                                        key: "Gender :",
                                        value: autoDetails['gender'] == "M"
                                            ? "Male"
                                            : autoDetails['gender'] == "F"
                                                ? "Female"
                                                : "",
                                      ),
                                      _containerItem(
                                        key: "Address :",
                                        value: autoDetails['address'],
                                      ),
                                      Gap(10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w,
                                                    vertical: 5.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    color: const Color(
                                                        0xFF089DED)),
                                                child: Center(
                                                    child: Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ))),
                                          ),
                                          Gap(10.w),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w,
                                                    vertical: 5.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    color: const Color(
                                                        0xFF089DED)),
                                                child: Center(
                                                    child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ))),
                                          ),
                                        ],
                                      ),
                                      Gap(10.h),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      autoDetails!['data']['car_policy_data'][0]['name'],
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      "EFFECTIVE DATE",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      autoDetails!['data']['car_policy_data'][0]['description'],
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      "EXPIRATION DATE",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      autoDetails!['data']['car_policy_data'][0]['expiry_date'],
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      "NEXT RENEWAL DATE",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      autoDetails!['data']['car_policy_data'][0]
                          ['renewal_date'],
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      "CURRENT PREMIUM",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      "\$${autoDetails!['data']['car_policy_data'][0]['total_premium_usd']}",
                      style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                    Gap(10.h),
                    Text(
                      'Additional fees may apply \nplease review your policy\ndocuments for details',
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                    Gap(20.h),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SecondryButton(
                              onTap: () {}, buttonText: 'Current ID Cards'),
                          Gap(15.h),
                          SecondryButton(
                              onTap: () {}, buttonText: 'Policy Documents'),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    Container(
                      height: 0.5,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Coverage',
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(15.h),
                        SecondryButton(
                            onTap: () {}, buttonText: 'Manage Vehicles'),
                      ],
                    ),
                    Gap(20.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                            autoDetails!['data']['vehicles'].length, (index) {
                          var car = autoDetails!['data']['vehicles'][index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 2.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                "${car['year']} ${car['make']} ${car['model']}",
                                                style: Get.textTheme.titleSmall
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10.sp,
                                                        fontFamily: "Poppins"),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: AppColors.primary,
                                                size: 25.h,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              )
                            ],
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _containerItem({required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              key,
              style: Get.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  fontFamily: "Poppins"),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: Get.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 10.sp,
                  fontFamily: "Poppins"),
            ),
          ),
        ],
      ),
    );
  }
}
