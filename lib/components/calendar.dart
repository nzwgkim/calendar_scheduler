import 'package:calenar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  DateTime? selectedDay;
  DateTime focusedDay;
  OnDaySelected onDaySelected;

  Calendar(
      {required this.selectedDay,
      required this.focusedDay,
      required this.onDaySelected,
      super.key});

  final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(6.0), color: Colors.grey[200]);

  final defaultTextStyle =
      TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(2000),
      lastDay: DateTime(2030),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (day) {
        print('Pred: $day');
        return isSameDay(selectedDay, day);
      },
      calendarStyle: CalendarStyle(
        defaultDecoration: defaultBoxDeco,
        weekendDecoration: defaultBoxDeco,
        selectedDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: PRIMARY_COLOR, width: 1)),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(color: PRIMARY_COLOR),
        outsideDecoration: const BoxDecoration(shape: BoxShape.rectangle),
      ),
    );
  }
}
