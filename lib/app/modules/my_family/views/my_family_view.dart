import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/utils/index.dart';
import '../../../../common_lib.dart';
import '../controllers/my_family_controller.dart';

class MyFamilyView extends GetView<MyFamilyController> {
  const MyFamilyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              const MyAppBar(title: "My Family"),
              DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: AppColors.secondry,
                        dividerColor: AppColors.textLight,
                        unselectedLabelColor: AppColors.primary,
                        automaticIndicatorColorAdjustment: true,
                        indicatorColor: AppColors.secondry,
                        indicatorWeight: 2.w,
                        tabs: [
                          Tab(
                            child: Text(
                              "Drivers",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Vehicals",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Homes",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TabBarView(
                      children: [
                        ShadowContainer(
                          child: Column(
                            children: [Gap(20)],
                          ),
                        ),
                        Container(),
                        Container(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
