import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/index.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: Obx(
            () => Stack(
              children: [
                Center(
                  child: Image.asset(
                    ImagePaths.mile,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedContainer(
                        duration: 300.milliseconds,
                        height: 8.h,
                        width: context.width * controller.value.value,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(
                            20.w,
                          ),
                        ),
                      ),
                      Gap(80.h),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
