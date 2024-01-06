import 'package:american_mile/common_lib.dart';
import '../../../../core/components/my_app_bar.dart';
import '../../../../core/helpers/image_paths.dart';
import '../../home/controllers/home_controller.dart';

class HomePolicyView extends StatelessWidget {
  HomePolicyView({super.key});

  final controller = Get.find<HomeController>();

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
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: const MyAppBar(title: 'Home Policy'),
              ),
              Gap(15.h),
              Image.asset(
                ImagePaths.house,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
