import 'dart:io';

import 'package:american_mile/core/utils/app_colors.dart';

import '../../../common_lib.dart';
import '../../../core/helpers/device_helper.dart';

errorDialog(
  String message, {
  String? title,
  VoidCallback? onTap,
  String? buttonTitle,
}) {
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

///
///
/// Exit app dialog
///
///
///
exitAppDialog(
    {String? title,
      String? message,
      VoidCallback? onTap,
      String? buttonTitle,
      required BuildContext context}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      title: Column(
        children: [
          Image.asset(
            "assets/img/logout_icon.png",
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 20),
          const Text(
            "Exit app?",
            style:
            TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
            textAlign: TextAlign.center,
          )
        ],
      ),
      content: Text(
        message ?? "Are you sure you want to\nexit the app?",
        style:
        const TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
               exit(0);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  ' exit ',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    ),
  );
}
///
///
///

///*********************************************************///
///*************** Logout dialog ***************************///
///*********************************************************///

logoutDialogNew(
    {String? title,
    String? message,
    VoidCallback? onTap,
    String? buttonTitle,
    required BuildContext context}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      title: Column(
        children: [
          Image.asset(
            "assets/img/logout_icon.png",
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 20),
          const Text(
            "Sign out?",
            style:
                TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
            textAlign: TextAlign.center,
          )
        ],
      ),
      content: Text(
        message ?? "Are you sure you want to\nsign out?",
        style:
            const TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                DeviceHelper.removeUserId();
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  'Log out',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    ),
  );
}

///*********************************************************///
///*************** Logout dialog ***************************///
///*********************************************************///

deleteItemDialog(
    {String? title,
    String? message,
    VoidCallback? onTap,
    String? buttonTitle,
    required BuildContext context}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      title: Column(
        children: [
          Icon(Icons.delete,size: 50.h,color: Colors.red,),
          const SizedBox(height: 20),
          const Text(
            "Delete?",
            style:
                TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
            textAlign: TextAlign.center,
          )
        ],
      ),
      content: Text(
        message ?? "Are you sure you want to\ndelete this item?",
        style:
            const TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  'Delete',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    ),
  );
}

/// =======================================

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
