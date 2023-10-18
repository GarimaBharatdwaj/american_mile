/// Modified

import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/index.dart';

class SpeedMeter extends StatefulWidget {
  const SpeedMeter({
    Key? key,
    required this.speed,
    required this.kiloMeterDriven,
  }) : super(key: key);

  final double speed;
  final int kiloMeterDriven;

  @override
  State<SpeedMeter> createState() => _SpeedMeterState();
}

class _SpeedMeterState extends State<SpeedMeter> {
  double rotationValue = 0.0;
  List kiloMeters = [];

  double leftPadding = 0.0;
  double rightPadding = 0.0;
  double bottomPadding = 12.0;

  @override
  void initState() {
    makeSevenItemsList();
    scaleValue(widget.speed);
    checkRotationValue();
    super.initState();
  }

  makeSevenItemsList() {
    kiloMeters =
        widget.kiloMeterDriven.toString().split('').map(int.parse).toList();
    if (kiloMeters.length < 7) {
      final numberOfZerosToAdd = 7 - kiloMeters.length;
      final zeroList = List<int>.filled(numberOfZerosToAdd, 0);
      kiloMeters = [...zeroList, ...kiloMeters];
    }
  }

  scaleValue(double input) {
    if (input >= 0 && input <= 160) {
      rotationValue = (input / 160) * 0.61;
    } else {
      rotationValue = 0.0;
    }
    debugPrint(rotationValue.toString());
  }

  checkRotationValue() {
    if (widget.speed >= 160) {
      rightPadding = 0.0;
      leftPadding = 50.0;
      bottomPadding = 25.h;
      rotationValue = 0.61;
      return;
    }

    if (widget.speed == 0) {
      rightPadding = 45.0;
      leftPadding = 0.0;
      bottomPadding = 30.h;
      rotationValue = -0.035;
      return;
    }
    if (rotationValue >= 0.0 && rotationValue < 0.1) {
      rightPadding = 45.0;
      leftPadding = 0.0;
      bottomPadding = 30.h;
    } else if (rotationValue > 0.1 && rotationValue < 0.25) {
      rightPadding = 45.0;
      leftPadding = 10.0;
      bottomPadding = 70.h;
    } else if (rotationValue > 0.26 && rotationValue < 0.29) {
      rightPadding = 45.0;
      leftPadding = 40.0;
      bottomPadding = 70.h;
    } else if (rotationValue > 0.29 && rotationValue < 0.34) {
      rightPadding = 40.0;
      leftPadding = 50.0;
      bottomPadding = 70.h;
    } else if (rotationValue > 0.34 && rotationValue < 0.4) {
      rightPadding = 20.0;
      leftPadding = 45.0;
      bottomPadding = 70.h;
    } else if (rotationValue > 0.4 && rotationValue < 0.5) {
      rightPadding = 10.0;
      leftPadding = 50.0;
      bottomPadding = 50.h;
    } else if (rotationValue > 0.5 && rotationValue < 0.54) {
      rightPadding = 0.0;
      leftPadding = 50.0;
      bottomPadding = 50.h;
    } else if (rotationValue > 0.54 && rotationValue < 0.61) {
      rightPadding = 0.0;
      leftPadding = 50.0;
      bottomPadding = 25.h;
    } else {
      rightPadding = 40.0;
      leftPadding = 0.0;
      rotationValue = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(80.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                ImagePaths.speedMeterScale,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(height: 50.h,),

                  Text("MPH",
                      style: Get.textTheme.titleMedium?.copyWith(
                          color: AppColors.textBlackColor,
                          fontWeight: FontWeight.w700)),
                  kiloMeterDial(),
                  Image.asset(
                    ImagePaths.kiloMeterContainer,
                    height: 90.w,
                    width: 180.h,
                  ),
                ],
              ),
            ],
          ),

          // Positioned(
          //   top: 100,
          //   bottom: 10,
          //   right: 50,
          //   left: 50,
          //   child: Container(
          //     color:Colors.red,child: kiloMetersDriven(),),
          // ),
        ],
      ),
    );
  }

  kiloMeterDial() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(rotationValue),
        child: Image.asset(
          ImagePaths.speedDial,
          fit: BoxFit.contain,
          height: 85.h,
          width: 85.h,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

  kiloMetersDriven() {
    return SizedBox(
      height: 95.h,
      width: 170.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            ImagePaths.kiloMeterContainer,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  7,
                  (index) => Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        ImagePaths.kiloMeterItem,
                        fit: BoxFit.contain,
                        height: 20.h,
                      ),
                      Text(
                          kiloMeters.isEmpty
                              ? '0'
                              : kiloMeters[index].toString(),
                          style: Get.textTheme.titleSmall?.copyWith(
                              color: AppColors.textBlackColor,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
