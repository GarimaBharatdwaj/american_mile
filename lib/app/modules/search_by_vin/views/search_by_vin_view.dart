import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/utils/index.dart';

import '../../../../core/components/primary_button.dart';
import '../controllers/search_by_vin_controller.dart';

class SearchByVinView extends GetView<SearchByVinController> {
  const SearchByVinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(15.w),
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
            Center(
                child: Text(
              'Look Up by VIN',
              style: Get.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            )),
            Gap(16.h),
            Image.asset(
              ImagePaths.carCircle,
              height: 260,
            ),
            Gap(16.h),
            LoginTextField(
              hintText: "Enter VIN",
              labelText: "VIN",
              controller: TextEditingController(),
            ),
            Padding(
              padding: EdgeInsets.all(30.w),
              child: PrimaryButton(
                buttonText: "Check Info",
                onTap: () {
                  Get.toNamed(Routes.CAR_DETAILS);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
