import '../../common_lib.dart';
import '../utils/index.dart';
import 'index.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: statusbarHeight + 80,
      padding: EdgeInsets.only(top: statusbarHeight),
      child: Row(
        children: [
          const Gap(8),
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
          const Gap(8),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
