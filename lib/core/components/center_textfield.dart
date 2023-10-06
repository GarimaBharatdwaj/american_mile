import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/utils/index.dart';

import '../../common_lib.dart';

class CenterTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CenterTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      child: TextFormField(
        controller: controller,
        style: Get.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
        cursorColor: AppColors.black,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
