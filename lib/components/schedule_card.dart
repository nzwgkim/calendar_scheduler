import 'package:calenar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String contents;
  final Color color;

  const ScheduleCard(
      {required this.startTime,
      required this.endTime,
      required this.contents,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Container(
          // height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: PRIMARY_COLOR),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Time(startTime: startTime, endTime: endTime),
                  const SizedBox(
                    width: 10,
                  ),
                  _Contents(contents: contents),
                  _Category(color: color),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  final Color color;
  const _Category({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: 16.0,
      height: 16.0,
    );
  }
}

class _Contents extends StatelessWidget {
  final String contents;
  const _Contents({required this.contents});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(contents));
  }
}

class _Time extends StatelessWidget {
  final int startTime;
  final int endTime;
  const _Time({required this.startTime, required this.endTime});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: PRIMARY_COLOR);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${startTime.toString().padLeft(2, '0')}:00', style: textStyle),
        Text('${endTime.toString().padLeft(2, '0')}:00',
            style: textStyle.copyWith(fontSize: 12))
      ],
    );
  }
}
