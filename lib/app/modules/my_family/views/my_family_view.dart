import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/components/secondry_button.dart';
import 'package:american_mile/core/utils/divider.dart';
import 'package:american_mile/core/utils/index.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../../common_lib.dart';
import '../controllers/my_family_controller.dart';

class MyFamilyView extends GetView<MyFamilyController> {
  const MyFamilyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColors.background,
          body: controller.isLoading.isTrue
              ? showProgressIndicator()
              : Padding(
                  padding: EdgeInsets.all(12.w),
                  child: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        _headerAppBarWidget(context),
                        _tabBarWidget(
                          context,
                        ),
                      ];
                    },
                    body: Column(
                      children: [
                        Expanded(
                          child: TabBarView(
                            controller: controller.tabCotroller,
                            children: [
                              _driversComponent(),
                              _vehicalComponent(),
                              Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          floatingActionButton: SpeedDial(
            icon: Icons.add_rounded,
            activeIcon: Icons.close_rounded,
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            activeBackgroundColor: AppColors.primary,
            activeForegroundColor: AppColors.white,
            visible: true,
            spacing: 8,
            spaceBetweenChildren: 8,
            closeManually: false,
            gradientBoxShape: BoxShape.rectangle,

            curve: Curves.bounceIn,
            overlayColor: AppColors.black,
            overlayOpacity: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12.w,
              ),
            ), //shape of button
            children: [
              SpeedDialChild(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12.w,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 25.w,
                ),
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                label: 'Add Driver',
                onTap: () {
                  Get.toNamed(
                    Routes.DRIVER_LICENCE,
                  )?.then((value) {
                    if (value) {
                      controller.myFamilyAPI();
                    }
                  });
                },
              ),
              SpeedDialChild(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12.w,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 25.w,
                ),
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                label: 'Add Vehical',
                onTap: () {
                  Get.toNamed(
                    Routes.SEARCH_BY_VIN,
                  )?.then((value) {
                    if (value) {
                      controller.myFamilyAPI();
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _headerAppBarWidget(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      floating: true,
      snap: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleSpacing: 0,
      leading: RRectIcon(
        image: ImagePaths.arrow,
        onTap: () => Get.back(),
      ),
      title: Text(
        "My Family",
        textAlign: TextAlign.center,
        style: Get.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  SliverAppBar _tabBarWidget(
    BuildContext context,
  ) {
    return SliverAppBar(
      pinned: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      titleSpacing: 0,
      title: Column(
        children: [
          TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Drivers",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Vehicals",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Homes",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.label,
// isScrollable: true,
            controller: controller.tabCotroller,
            labelPadding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            indicator: MD2Indicator(indicatorColor: AppColors.primary),
          ),
        ],
      ),
    );
  }

  _containerItem({required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              key,
              style: Get.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Get.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _driversComponent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20.h),
          ...List.generate(controller.familyDetails!['drivers'].length,
              (index) {
            var driver = controller.familyDetails!['drivers'][index];
            return Column(
              children: [
                ShadowContainer(
                  child: Column(
                    children: [
                      Image.asset(
                        ImagePaths.userIcon,
                        height: 80.w,
                        width: 80.w,
                      ),
                      Gap(8.h),
                      Text(
                        driver['name'],
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(16.h),
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
                      Gap(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SecondryButton(
                            buttonText: "Edit",
                            onTap: () {
                              Get.toNamed(
                                Routes.DRIVER_DETAILS,
                                arguments: {
                                  'isAddingManually': true,
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
                          ),
                          SecondryButton(
                            buttonText: "Remove",
                            onTap: () {
                              controller.deleteDriverAPI(
                                driver['id'],
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
              ],
            );
          }),
        ],
      ),
    );
  }

  _vehicalComponent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20.h),
          ...List.generate(controller.familyDetails!['vehicles'].length,
              (index) {
            var vehical = controller.familyDetails!['vehicles'][index];
            return Column(
              children: [
                ShadowContainer(
                  child: Column(
                    children: [
                      Image.asset(
                        ImagePaths.carIcon,
                        height: 80.w,
                        width: 80.w,
                      ),
                      Gap(8.h),
                      Text(
                        "${vehical['year']} ${vehical['make']}\n${vehical['model']}",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Gap(16.h),
                      _containerItem(
                        key: "VIN # :",
                        value: vehical['vin_number'],
                      ),
                      _containerItem(
                        key: "Year :",
                        value: vehical['year'],
                      ),
                      _containerItem(
                        key: "Make :",
                        value: vehical['make'],
                      ),
                      _containerItem(
                        key: "Model :",
                        value: vehical['model'],
                      ),
                      _containerItem(
                        key: "Body :",
                        value: vehical['body'],
                      ),
                      Gap(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SecondryButton(
                            buttonText: "Edit",
                            onTap: () {
                              Get.toNamed(Routes.CAR_DETAILS, arguments: {
                                'isAddingManually': true,
                                'vinNumber': vehical['vin_number'],
                                'year': vehical['year'],
                                'make': vehical['make'],
                                'model': vehical['model'],
                                'body': vehical['body'],
                                'type': '1',
                                'vehical_id': vehical['id'],
                              })?.then(
                                (value) {
                                  if (value) {
                                    controller.myFamilyAPI();
                                  }
                                },
                              );
                            },
                          ),
                          SecondryButton(
                            buttonText: "Remove",
                            onTap: () {
                              controller.deleteDriverAPI(
                                vehical['id'],
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class MD2Indicator extends Decoration {
  final Color indicatorColor;

  const MD2Indicator({required this.indicatorColor});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MD2Painter(this, onChanged);
  }
}

class _MD2Painter extends BoxPainter {
  final MD2Indicator decoration;

  _MD2Painter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    Rect rect;
    rect = Offset(
          offset.dx,
          configuration.size!.height - 4,
        ) &
        Size(configuration.size!.width, 4);

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      ),
      paint,
    );
  }
}
