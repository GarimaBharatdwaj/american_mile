import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';

class OfferSelectionPage extends StatelessWidget {
  const OfferSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            const MyAppBar(
              title: 'Offer',
            ),
            Gap(30.h),
            Image.asset(ImagePaths.offerPlace),
            Gap(30.h),
            Text(
              "Get personal assistance\nshopping for insurance",
              style: Get.textTheme.titleLarge?.copyWith(height: 1.4),
            ),
            Gap(20.h),
            Text(
              "Our agents will find your best deals, text their\nrecommendation, and can help you switch!",
              style: Get.textTheme.bodyMedium?.copyWith(height: 1.4),
            ),
            Gap(30.h),
            Padding(
              padding: EdgeInsets.all(30.w),
              child: PrimaryButton(
                buttonText: "No Thanks",
                onTap: () {
                  Get.toNamed(Routes.USER_PROFILE);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: PrimaryButton(
                backgroundColor: AppColors.textBlackColor,
                buttonText: "OK",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
