import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(2000),
      lastDay: DateTime(2030),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      onDaySelected: (selectedDay, focusedDay) {
        print('sel: $selectedDay');
        this.selectedDay = selectedDay;
        setState(() {});
      },
      selectedDayPredicate: (day) {
        print('Predicate: $day');
        return isSameDay(selectedDay, day);
      },
    );
  }
}
