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

  double leftPadding = 20.0;
  double rightPadding = 30.0;

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
      leftPadding = 30.0;
      rotationValue = 0.66;
      return;
    }
    if (widget.speed == 0) {
      rotationValue = -0.05;
      return;
    }
    rightPadding = 25.0;
    if (rotationValue >= 0.0 && rotationValue <= 0.1) {
      leftPadding = 0.0;
    } else if (rotationValue <= 0.25) {
      leftPadding = 10.0;
    } else if (rotationValue <= 0.29) {
      leftPadding = 20.0;
    } else if (rotationValue <= 0.5) {
      leftPadding = 30.0;
    } else if (rotationValue <= 0.54) {
      rightPadding = 0.0;
      leftPadding = 20.0;
    } else if (rotationValue <= 0.61) {
      rightPadding = 15.0;
      leftPadding = 40.0;
    } else {
      rotationValue = -0.05;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 150.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            ImagePaths.speedMeterScale,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("MPH",
                  style: Get.textTheme.titleSmall?.copyWith(
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w700)),
              kiloMeterDial(),
              Gap(16.h),
            ],
          ),
        ],
      ),
    );
  }

  kiloMeterDial() {
    return Container(
      margin: EdgeInsets.only(left: leftPadding.w, right: rightPadding.w),
      height: 70.h,
      width: 70.h,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(rotationValue),
        child: Image.asset(
          ImagePaths.speedDial,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

  kiloMetersDriven() {
    return SizedBox(
      height: 55.h,
      width: 102.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            ImagePaths.kiloMeterContainer,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h, left: 1.w),
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
                        height: 18.h,
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
