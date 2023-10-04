import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0053D3),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Image.asset(ImagePaths.onboardOne),
            ),
            Expanded(
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  children: [
                    Gap(16),
                    Text(
                      'Our pay-per-mile\nInsurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Our pay-per-mile insurance is straight forward, easy to use, and can save low-mileage drivers 30-40% off their current rates.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
