import 'package:drift/drift.dart';

/// Stub implementation - never actually called
/// The conditional imports will choose the right platform implementation
QueryExecutor createDatabaseConnection() {
  throw UnsupportedError(
    'No suitable database implementation was found on this platform.',
  );
}