import 'package:american_mile/app/modules/home/controllers/home_controller.dart';
import 'package:american_mile/app/modules/profile/views/profile_view.dart';
import 'package:american_mile/app/modules/user_profile/controllers/user_profile_controller.dart';
import 'package:american_mile/app/modules/user_profile/views/user_profile_view.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../core/helpers/device_helper.dart';
import '../../../../../core/helpers/image_paths.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.find<HomeController>();

  bool active = false;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: AppColors.primary,
    //   ),
    // );

    return SafeArea(
      child: Obx(
        () => controller.isMyFamily.value
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 5.h,
                      color: AppColors.primary,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5.3,
                      decoration: BoxDecoration(
                        color: AppColors.primary,

                        ///image: const DecorationImage(image: AssetImage('assets/img/blue_back.png')),

                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0.5, 0.5),
                              color: AppColors.primary,
                              spreadRadius: 2)
                        ],
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40)),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 25,
                            left: 25,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.USER_PROFILE);
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 44.h,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 41.h,
                                      foregroundImage: const NetworkImage(
                                          "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg"),
                                    ),
                                  ),
                                  Gap(10.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Hi,",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        controller.userData?['name']
                                                .toString()
                                                .split(' ')
                                                .first ??
                                            "User",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22.sp),
                                      ),
                                      Text(
                                        controller.email.text,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //  ),

                          Positioned(
                              top: 25,
                              right: 25,
                              child: GestureDetector(
                                onTap: () {
                                  DeviceHelper.removeUserId();
                                  Get.offAllNamed(Routes.LOGIN);
                                },
                                child: const Icon(
                                  Icons.logout_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              )),

                          /// ElevatedButton(onPressed: (){}, child: Text("Update profile",style: TextStyle(color: Colors.blue),),style: ElevatedButton.styleFrom(backgroundColor: Colors.white),),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    addDriverComponent("Driver", () {
                      Get.toNamed(
                        Routes.DRIVER_LICENCE,
                      )?.then((value) {
                        if (value) {
                          controller.myFamilyAPI();
                        }
                      });
                    }),
                    Obx(
                      () => expansionTileComponent(context, "Drivers", 1),
                    ),
                    addDriverComponent("Vehicle", () {
                      Get.toNamed(
                        Routes.SEARCH_BY_VIN,
                      )?.then((value) {
                        if (value) {
                          controller.myFamilyAPI();
                        }
                      });
                    }),
                    Obx(
                      () => expansionTileComponent(context, "Vehicles", 2),
                    ),
                    addDriverComponent("Home", () {}),
                    Obx(
                      () => expansionTileComponent(context, "Homes", 3),
                    ),
                    Gap(20.h),
                  ],
                ),
              ),
      ),
    );
  }

  expansionTileComponent(BuildContext context, title, ind) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: ExpansionPanelList(
            elevation: 0,
            expandIconColor: Colors.green,
            expansionCallback: (panelIndex, expanded) {
              controller.toggleFamily(ind);
              // ind == 1
              //     ? controller.active[0] = !controller.active[0]
              //     : ind == 2
              //         ? controller.active[1] = !controller.active[1]
              //         : controller.active[2] = !controller.active[2];
            },
            children: [
              ExpansionPanel(
                backgroundColor: AppColors.white,
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              fontFamily: 'Poppins'),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: const Divider(
                            thickness: 0.5,
                            color: Colors.lightBlue,
                          ),
                        )),
                      ],
                    ),
                  );
                },
                body: title == "Drivers"
                    ? myDriverComponent(
                        context, controller.familyDetails?['drivers'])
                    : title == "Vehicles"
                        ? myVehicleComponent(
                            context, controller.familyDetails?['vehicles'])
                        : myHomeComponent(
                            context, controller.familyDetails?['address']),

                /// buildNewTasks(
                ///     context, controller.familyDetails?['drivers']),
                isExpanded:

                    /// controller.toggleFamily(ind),
                    ind == 1
                        ? controller.active[0]
                        : ind == 2
                            ? controller.active[1]
                            : controller.active[2],
                canTapOnHeader: true,
              ),
            ],
          ),
        )
      ],
    );
  }

  Padding addDriverComponent(String titleOne, void Function()? onTap) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 35.h, bottom: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "My $titleOne",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22.sp,
                fontFamily: 'Poppins'),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  color: const Color(0xFF089DED)),
              child: Center(
                  child: Text(
                "Add New $titleOne",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              )),
            ),
          ),
        ],
      ),
    );
  }

  myDriverComponent(BuildContext context, list) {
    return Column(
      children: [
        ...List.generate(list.length, (index) {
          var driver = list?[index];
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 35.h,
                          backgroundColor: AppColors.primary,
                          child: CircleAvatar(
                              radius: 33.h,
                              foregroundImage: AssetImage(
                                ImagePaths.userIcon,
                              ))),
                      Gap(10.h),
                      SizedBox(
                        width: 120.w,
                        child: Text(
                          driver['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                            width: MediaQuery.of(context).size.width / 1.9,
                            child: Column(
                              children: [
                                _containerItem(
                                  key: "License # :",
                                  value: driver['license_number'],
                                ),
                                _containerItem(
                                  key: "Date of Birth :",
                                  value: driver['dob'],
                                ),
                                _containerItem(
                                  key: "Gender :",
                                  value: driver['gender'] == "M"
                                      ? "Male"
                                      : driver['gender'] == "F"
                                          ? "Female"
                                          : "",
                                ),
                                _containerItem(
                                  key: "Address :",
                                  value: driver['address'],
                                ),
                                Gap(10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          Routes.DRIVER_DETAILS,
                                          arguments: {
                                            'isAddingManually': false,
                                            'edit': true,
                                            'driverId': driver['id'],
                                            'name': driver['name'],
                                            'gender': driver['gender'],
                                            'dob': driver['dob'],
                                            'dl': driver['license_number'],
                                            'address': driver['address']
                                          },
                                        )?.then((value) {
                                          if (value) {
                                            controller.myFamilyAPI();
                                          }
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: const Color(0xFF089DED)),
                                          child: Center(
                                              child: Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ))),
                                    ),
                                    Gap(10.w),
                                    GestureDetector(
                                      onTap: () {
                                        controller.deleteDriverAPI(
                                          driver['id'],
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: const Color(0xFF089DED)),
                                          child: Center(
                                              child: Text(
                                            "Remove",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
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
          );
        })
      ],
    );
  }

  myVehicleComponent(BuildContext context, list) {
    return Column(
      children: [
        ...List.generate(list.length, (index) {
          var vehicles = list?[index];
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 35.h,
                          backgroundColor: AppColors.primary,
                          child: CircleAvatar(
                              radius: 33.h,
                              foregroundImage: AssetImage(
                                ImagePaths.carIcon,
                              ))),
                      Gap(10.h),
                      SizedBox(
                        width: 120.w,
                        child: Text(
                          "${vehicles['year']} ${vehicles['make']}\n${vehicles['model']}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                          "Vehicles Details",
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
                            width: MediaQuery.of(context).size.width / 1.9,
                            child: Column(
                              children: [
                                _containerItem(
                                  key: "VIN # :",
                                  value: vehicles['vin_number'],
                                ),
                                _containerItem(
                                  key: "Year :",
                                  value: vehicles['year'],
                                ),
                                _containerItem(
                                  key: "Make :",
                                  value: vehicles['make'],
                                ),
                                _containerItem(
                                  key: "Model :",
                                  value: vehicles['model'],
                                ),
                                vehicles['body'] == null ||
                                        vehicles['body'] == ""
                                    ? Container()
                                    : _containerItem(
                                        key: "Body :",
                                        value: vehicles['body'],
                                      ),
                                Gap(10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.CAR_DETAILS,
                                            arguments: {
                                              'isAddingManually': true,
                                              'vinNumber':
                                                  vehicles['vin_number'],
                                              'year': vehicles['year'],
                                              'make': vehicles['make'],
                                              'model': vehicles['model'],
                                              'body': vehicles['body'],
                                              'type': '1',
                                              'vehical_id': vehicles['id'],
                                            })?.then(
                                          (value) {
                                            if (value) {
                                              controller.myFamilyAPI();
                                            }
                                          },
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: const Color(0xFF089DED)),
                                          child: Center(
                                              child: Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ))),
                                    ),
                                    Gap(10.w),
                                    GestureDetector(
                                      onTap: () {
                                        controller.deleteVehicleAPI(
                                          vehicles['id'],
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: const Color(0xFF089DED)),
                                          child: Center(
                                              child: Text(
                                            "Remove",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
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
          );
        })
      ],
    );
  }

  myHomeComponent(BuildContext context, list) {
    return Column(
      children: [
        ...List.generate(list.length, (index) {
          var home = list?[index];
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                    child: Column(
                      children: [
                        Gap(10.h),
                        CircleAvatar(
                            radius: 35.h,
                            backgroundColor: AppColors.primary,
                            child: CircleAvatar(
                                radius: 33.h,
                                foregroundImage: AssetImage(
                                  ImagePaths.house,
                                ))),
                        Gap(10.h),
                      ],
                    ),
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
                          "Home Details",
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
                            width: MediaQuery.of(context).size.width / 1.9,
                            child: Column(
                              children: [
                                _containerItem(
                                  key: "Address :",
                                  value: home['full_address'].toString(),
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
          );
        })
      ],
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

  Widget buildNewTasks(BuildContext context, list) {
    return ListView.builder(
        physics: const ScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          var driver = list?[index];
          return Padding(
            padding: EdgeInsets.all(2.h),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
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
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              driver['name'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        Gap(10.w),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Driver Details ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Licence #",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "Date of birth",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "Address",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            driver['license_number'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            driver['dob'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            driver['address'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: AppColors.primary),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 4.h),
                                        child: Center(
                                            child: Text(
                                          "Edit",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: AppColors.primary),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 4.h),
                                        child: Center(
                                            child: Text(
                                          " Remove ",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
