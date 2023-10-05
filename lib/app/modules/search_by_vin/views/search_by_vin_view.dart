import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/utils/index.dart';

import '../controllers/search_by_vin_controller.dart';

class SearchByVinView extends GetView<SearchByVinController> {
  const SearchByVinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'VIN'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Gap(32),
          Center(
              child: Text(
            'Look Up by VIN',
            style:
                Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          )),
          const Gap(16),
          Image.asset(
            ImagePaths.carCircle,
            height: 260,
          ),
          const Gap(16),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('VIN'),
              hintText: 'Enter VIN',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Check Info'),
            ),
          )
        ],
      ),
    );
  }
}
