/// Email validation using regex
bool isValidEmail(String email) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegex.hasMatch(email);
}

/// Password validation (minimum 8 characters)
bool isValidPassword(String password) {
  return password.length >= 8;
}

/// Name validation (not empty)
bool isValidName(String name) {
  return name.trim().isNotEmpty;
}