import 'package:hive_flutter/hive_flutter.dart';
import 'user/user_table.dart';

class HiveDatabase {
  static const String boxName = 'usersBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  Box get box => Hive.box(boxName);

  Future<List<User>> getAllUsers() async {
    final box = Hive.box(boxName);
    return box.values
        .map((e) => User.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> addUser(User user) async {
    final box = Hive.box(boxName);
    await box.add(user.toMap());
  }

  Future<User?> getUserByEmail(String email) async {
    final box = Hive.box(boxName);
    for (var item in box.values) {
      final user = User.fromMap(Map<String, dynamic>.from(item));
      if (user.email == email) return user;
    }
    return null;
  }

  Future<User?> loginUser(String email, String password) async {
    final box = Hive.box(boxName);
    for (var item in box.values) {
      final user = User.fromMap(Map<String, dynamic>.from(item));
      if (user.email == email && user.password == password) return user;
    }
    return null;
  }
}
