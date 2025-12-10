import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  TextColumn get email => text().unique()();

  TextColumn get password => text().withLength(min: 8, max: 255)();

  IntColumn get age => integer()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}