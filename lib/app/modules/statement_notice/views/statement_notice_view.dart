import 'package:american_mile/common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/statement_notice_controller.dart';

class StatementNoticeView extends GetView<StatementNoticeController> {
  const StatementNoticeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(15.w),
            child: Column(
              children: [
                Row(
                  children: [
                    RRectIcon(
                      image: ImagePaths.arrow,
                      onTap: () {},
                    ),
                    Expanded(
                      child: Text(
                        'Statement & Notices',
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
                _statementItem(
                  context,
                  policyTitle: "2 AUTOS ON POLICY",
                  policyNumber: "#A229112875",
                ),
                Gap(40.h),
                _statementItem(
                  context,
                  policyTitle: "9926 N 16TH PIE",
                  policyNumber: "#D525999243",
                ),
              ],
            ),
          )),
    );
  }

  _statementItem(
    BuildContext context, {
    required String policyTitle,
    required String policyNumber,
  }) {
    return ShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(policyTitle,
              style: Get.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              )),
          Gap(10.h),
          Text("Account", style: Get.textTheme.titleMedium),
          Gap(10.h),
          Text(
            policyNumber,
            style: Get.textTheme.titleLarge?.copyWith(
              fontSize: 24.sp,
            ),
          ),
          Gap(28.h),
          Row(
            children: [
              SizedBox(
                width: context.width * .20,
                child: Text(
                  "Date",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleSmall?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Type",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleSmall?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                width: context.width * .20,
                child: Text(
                  "Amount",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleSmall?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          Gap(15.h),
          _tableItem(context, type: 'Statement'),
          Gap(15.h),
          _tableItem(context),
          Gap(15.h),
          _tableItem(context),
          Gap(15.h),
        ],
      ),
    );
  }

  _tableItem(
    BuildContext context, {
    String? type,
  }) {
    return Row(
      children: [
        SizedBox(
          width: context.width * .20,
          child: Text(
            "06/14/2023",
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium?.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
        Expanded(
          child: Text(
            type ?? "Notice of Cancellation",
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium?.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
        SizedBox(
          width: context.width * .20,
          child: Text(
            "\$333.00",
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium?.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
