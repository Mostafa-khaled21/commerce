class User {
  String name;
  String email;
  String password;
  int age;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'age': age,
    };
  }

  factory User.fromMap(Map map) {
    return User(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      age: map['age'],
    );
  }
}
