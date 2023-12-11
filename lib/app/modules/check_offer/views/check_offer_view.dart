import 'package:american_mile/app/modules/check_offer/views/offer_selection_page.dart';
import 'package:american_mile/core/components/primary_button.dart';

import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/check_offer_controller.dart';

class CheckOfferView extends GetView<CheckOfferController> {
  const CheckOfferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(
              title: 'Offer',
            ),
            Gap(30.h),
            Text(
              "Where should we send your offers?",
              style: Get.textTheme.titleSmall,
            ),
            Gap(20.h),
            CenterTextField(
              controller: TextEditingController(),
              hintText: "Mobile Number",
            ),
            Gap(20.h),
            CenterTextField(
              controller: TextEditingController(),
              hintText: "Email Address",
            ),
            Gap(30.h),
            Padding(
              padding: EdgeInsets.all(30.w),
              child: PrimaryButton(
                buttonText: "Continue",
                onTap: () {
                  Get.to(
                    () => const OfferSelectionPage(),
                  );
                },
              ),
            ),
            Center(
              child: Text(
                "Comparing Insurance with Savvy is free and will not\naffect your credit score. By clicking Continue you agree\nto Savvy's Privacy Policy, to Savvy's Terms of Service, and\nto allowing Savvy and its partners to use your third-party\nconsumer reports to calculate accurate quotes and to\nfollow-up via manual and automated emails, phone\ncalls, text messages at the contact points registered with\nyour account. Consent is not a condition of purchase.\nMessage frequency varies. Message and data rates may\napply. Reply HELP for help and STOP to opt out.",
                //  textAlign: TextAlign.center,
                style: Get.textTheme.bodySmall
                    ?.copyWith(fontSize: 13.sp, height: 1.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
