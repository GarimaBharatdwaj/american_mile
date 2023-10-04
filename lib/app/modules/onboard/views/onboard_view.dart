import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/index.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headings = [
      'Our pay-per-mile\nInsurance',
      'We charge pennies\nand value privacy.',
      'Big fans of fairness\nand transparency.'
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0053D3),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: controller.onPageChanged,
                controller: controller.pageController,
                itemBuilder: (context, index) {
                  return _OnBoardImageOne(
                    index == 0
                        ? ImagePaths.onboardOne
                        : index == 1
                            ? ImagePaths.onboardTwo
                            : ImagePaths.onboardThree,
                  );
                },
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
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
                    Expanded(
                      child: PageView.builder(
                        controller: controller.pageControllerTwo,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: controller.onPageChanged,
                        itemBuilder: (context, index) {
                          return _OnBoardContent(
                            heading: index == 0
                                ? headings[0]
                                : index == 1
                                    ? headings[1]
                                    : headings[2],
                            subHeading:
                                'Our pay-per-mile insurance is straight forward, easy to use, and can save low-mileage drivers 30-40% off their current rates.',
                          );
                        },
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.isLastPage.isFalse,
                        child: TextButton(
                          onPressed: () => Get.offAllNamed(Routes.HOME),
                          child: const Text('Skip'),
                        ),
                      ),
                    ),
                    Obx(
                      () => FilledButton(
                        onPressed: controller.onNextPage,
                        child: Text(
                          controller.isLastPage.isTrue ? 'Get Started' : 'Next',
                        ),
                      ),
                    ),
                    const Gap(60),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OnBoardContent extends StatelessWidget {
  final String heading;
  final String subHeading;

  const _OnBoardContent({required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(24),
        Text(
          heading,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            subHeading,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF615C5C),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const Gap(36),
      ],
    );
  }
}

class _OnBoardImageOne extends StatelessWidget {
  const _OnBoardImageOne(this.imagePath);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Image.asset(imagePath),
    );
  }
}
