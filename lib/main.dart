import 'package:calenar_scheduler/components/calendar.dart';
import 'package:calenar_scheduler/components/schedule_bottom_sheet.dart';
import 'package:calenar_scheduler/components/schedule_card.dart';
import 'package:calenar_scheduler/components/today_banner.dart';
import 'package:calenar_scheduler/const/colors.dart';
import 'package:calenar_scheduler/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // intl 초기화
  await initializeDateFormatting();

  final database = LocalDatabase();
  print('--------------');
  print(await database.getCategoryColors());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(
        fontFamily: 'NotoSans',
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    print('HomeScreen 1) sel: $selectedDay');
    int count = 5;
    return Scaffold(
      floatingActionButton: floatingButton(),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Calendar(
                  selectedDay: selectedDay,
                  focusedDay: focusedDay,
                  onDaySelected: onDaySelected),
              TodayBanner(scheduledCount: count, selectedDay: selectedDay),
              ScheduledList(count: count),
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton floatingButton() {
    return FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
// showModalBottomSheet는 기본적으로 최대크기가 화면의 1/2이다.
// isScrollControlled를 true로 하면, 더 크게 할 수 있다.
// 즉, keyboard의 size를 고려한 bottomsheet를 구현할 수 있다.
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => const ScheduleBottomSheet(),
          );
        },
        child: const Icon(Icons.add));
  }

  onDaySelected(selectedDay, focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;

      print('HomeScreen 2) sel: ${this.selectedDay}');
    });
  }
}

class ScheduledList extends StatelessWidget {
  final int count;
  const ScheduledList({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) => const ScheduleCard(
            startTime: 5, endTime: 6, contents: 'contents', color: Colors.red),
      ),
    );
  }
}
