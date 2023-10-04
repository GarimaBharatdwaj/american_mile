import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/index.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0053D3),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: controller.onPageChanged,
                controller: controller.pageController,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Image.asset(ImagePaths.onboardOne),
                  );
                },
              ),
            ),
            Container(
              width: context.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const Gap(16),
                  const Text(
                    'Our pay-per-mile\nInsurance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Our pay-per-mile insurance is straight forward, easy to use, and can save low-mileage drivers 30-40% off their current rates.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const Gap(24),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Next'),
                  ),
                  TextButton(
                    onPressed: () => Get.offAllNamed(Routes.HOME),
                    child: const Text('Skip'),
                  ),
                  const Gap(24),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
