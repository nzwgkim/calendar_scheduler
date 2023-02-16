import 'package:calenar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduledCount;
  const TodayBanner(
      {required this.scheduledCount, required this.selectedDay, super.key});

  @override
  Widget build(BuildContext context) {
    // print('TodayBanner) sel: $selectedDay');
    const textStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
    return Container(
      color: PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
              style: textStyle,
            ),
            Text(
              'Count: $scheduledCount',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
