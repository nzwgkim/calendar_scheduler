import 'package:drift/drift.dart';

class Schedules extends Table {
  // PRIMARY KEY
  IntColumn get id => integer().autoIncrement()();

  // contents
  TextColumn get contents => text()();

  // 일정/날짜
  DateTimeColumn get date => dateTime()();
  IntColumn get start => integer()();
  IntColumn get end => integer()();

  // Category color table id
  IntColumn get colorId => integer()();

  // 생성날짜
  DateTimeColumn get createAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();
}
