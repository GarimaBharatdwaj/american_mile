import 'dart:ui';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/index.dart';
import '../controllers/car_dashboard_controller.dart';

class CarDashboardView extends GetView<CarDashboardController> {
  const CarDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: context.height,
            width: context.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFED08A1).withOpacity(.12),
                  Color(0xFFED0808).withOpacity(.12),
                  Color(0xFFED0808).withOpacity(.12),
                  Color(0xFF3E3E3E),
                  Color(0xFF3E3E3E),
                  Color(0xFF3E3E3E),
                  Color(0xFF3E3E3E),
                  Color(0xFF3E3E3E),
                  Color(0xFF3E3E3E),
                  Color(0xFF3E3E3E),
                ],
                tileMode: TileMode.clamp,
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Center(child: Image.asset(ImagePaths.car1)),
                Center(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.5)),
                        child: Center(
                          child: Text(
                            'Frosted',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // child: Column(
            //   children: [
            //     Gap(100.h),
            //     ShadowContainer(
            //       backgroundColor: AppColors.black,
            //       child: Column(
            //         children: [],
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
