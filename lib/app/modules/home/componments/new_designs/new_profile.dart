import 'package:american_mile/common_lib.dart';
import 'package:flutter/services.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    /// Future.delayed(const Duration(seconds: 1), () {
    //   SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //       statusBarColor: Colors.blue,
    //     ),
    //   );
    /// });

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: const Text(""),
          systemOverlayStyle:
              SystemUiOverlayStyle.light // or use SystemUiOverlayStyle.light
          ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              decoration: const BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.5, 0.5),
                      color: Colors.blue,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40.h,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 36.h,
                            foregroundImage: const NetworkImage(
                                "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg"),
                          ),
                        ),
                        Gap(10.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hi,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              "Adam",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24),
                            ),
                            const Text(
                              "adambrettrobin@gmail.com",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                      top: 25,
                      right: 25,
                      child: Icon(
                        Icons.logout_outlined,
                        size: 30,
                        color: Colors.white,
                      )),

                  /// ElevatedButton(onPressed: (){}, child: Text("Update profile",style: TextStyle(color: Colors.blue),),style: ElevatedButton.styleFrom(backgroundColor: Colors.white),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
