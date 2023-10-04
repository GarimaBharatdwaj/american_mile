import '../../common_lib.dart';
import '../utils/index.dart';
import 'index.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RRectIcon(
          image: ImagePaths.arrow,
          onTap: () {},
        ),
        Expanded(
          child: Text(
            title,
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
    );
  }
}
