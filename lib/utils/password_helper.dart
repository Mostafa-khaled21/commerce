import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Hash password using SHA256
String hashPassword(String password) {
  final bytes = utf8.encode(password);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

/// Verify password against hash
bool verifyPassword(String password, String hash) {
  return hashPassword(password) == hash;
}