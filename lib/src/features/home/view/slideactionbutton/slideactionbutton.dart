import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../controller/attendenceMarkController/attendenceMarkController.dart';

class SlideActionButton extends StatelessWidget {
  SlideActionButton({Key? key}) : super(key: key);

  final AttendenceController _attendenceController = Get.put(AttendenceController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 16, // Adjust bottom position as needed
      child: Padding(
        padding: EdgeInsets.only(right: 85, left: 16),
        child: Obx(() {
          final isCheckedIn = _attendenceController.isCheckedIn.value;
          final isButtonVisible = _attendenceController.isButtonVisible.value;

          return Visibility(
            visible: isButtonVisible,
            child: SlideAction(
              sliderButtonIconPadding: 10,
              height: 57,
              onSubmit: () async {
                await _attendenceController.uploadattendence();
              },
              text: isCheckedIn
                  ? 'Slide to check out'
                  : 'Slide to check in',
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              innerColor: Colors.white.withOpacity(0.5),
              outerColor: Color(0xff13322A),
            ),
          );
        }),
      ),
    );
  }
}
