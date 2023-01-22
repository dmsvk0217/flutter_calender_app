import 'package:flutter/material.dart';
import 'package:flutter_calender/const/color.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;
  const TodayBanner(
      {required this.scheduleCount, required this.selectedDay, super.key});

  final textStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary_color,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일",
            style: textStyle,
          ),
          Text(
            "$scheduleCount개",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
