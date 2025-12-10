import 'package:drift/drift.dart';
import 'database_connection.dart';
import 'user/user_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(createDriftDatabase());

  @override
  int get schemaVersion => 1;

  // User operations
  Future<List<User>> getAllUsers() => select(users).get();

  Stream<List<User>> watchUsers() => select(users).watch();

  Future<int> insertUser(UsersCompanion data) => into(users).insert(data);

  Future<bool> updateUser(User user) => update(users).replace(user);

  Future<int> deleteUser(int id) =>
      (delete(users)..where((u) => u.id.equals(id))).go();

  // Auth operations
  Future<User?> getUserByEmail(String email) async {
    return await (select(users)..where((u) => u.email.equals(email)))
        .getSingleOrNull();
  }

  Future<User?> loginUser(String email, String hashedPassword) async {
    return await (select(users)
      ..where((u) =>
      u.email.equals(email) &
      u.password.equals(hashedPassword)))
        .getSingleOrNull();
  }
}