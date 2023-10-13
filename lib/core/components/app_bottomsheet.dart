import '../../common_lib.dart';

class AppBottomSheet {
  static kImagePickerBottomSheet(
    BuildContext context, {
    VoidCallback? onCameraTap,
    VoidCallback? onGalleryTap,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _Popover(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: onCameraTap,
                    child: Container(
                      width: 110,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Get.theme.primaryColor.withOpacity(0.2),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                          ),
                          Gap(8.w),
                          const Text('Camera'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onGalleryTap,
                    child: Container(
                      width: 110,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Get.theme.primaryColor.withOpacity(0.2),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.photo_outlined,
                            size: 40,
                          ),
                          Gap(8.w),
                          const Text('Gallery'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20.h)
            ],
          ),
        );
      },
    );
  }

  static kDefaultBottomSheet(BuildContext context, {Widget? body}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return _Popover(
          child: body,
        );
      },
    );
  }
}

class _Popover extends StatelessWidget {
  const _Popover({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        margin: EdgeInsets.all(12.w),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildHandle(context), if (child != null) child!],
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
