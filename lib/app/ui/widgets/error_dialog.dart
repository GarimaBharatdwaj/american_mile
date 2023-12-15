
import '../../../common_lib.dart';

errorDialog(String message,
    {String? title, VoidCallback? onTap, String? buttonTitle,}) {
  showDialog(
    context: Get.context!,
    builder: (ctx) => AlertDialog(
      title: Text(title ?? "Error"),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: onTap ??
              () {
                Navigator.of(ctx).pop();
              },
          child: Text(buttonTitle ?? "Okay"),
        ),
      ],
    ),
  );
}

logoutDialog(String message,
    {String? title, VoidCallback? onTap, String? buttonTitle}) {
  showDialog(
    context: Get.context!,
    builder: (ctx) => AlertDialog(
      title: Text(title ?? "Error"),
      content: const Text("Are you sure, you want to exit?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            /// DeviceHelper.removeUserToken();
            Get.offAllNamed(Routes.LOGIN);
          },
          child: const Text("Logout"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: const Text("Stay"),
        ),
      ],
    ),
  );
}

forceLogoutDialog() {
  showDialog(
    context: Get.context!,
    builder: (ctx) => AlertDialog(
      title: const Text("Error"),
      content: const Text("Something went wrong!"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: const Text("Okay"),
        ),
      ],
    ),
  );
}

showAppDialog() {
  showDialog(
    context: Get.context!,
    builder: (ctx) => AlertDialog(
      title: const Text("Error"),
      content: const Text("Something went wrong!"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: const Text("Okay"),
        ),
      ],
    ),
  );
}
