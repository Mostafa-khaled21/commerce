import 'package:drift/drift.dart';

// Import platform-specific implementations
import 'database_connection_stub.dart'
if (dart.library.html) 'database_connection_web.dart'
if (dart.library.io) 'database_connection_native.dart';

/// Creates the appropriate database connection for the current platform
QueryExecutor createDriftDatabase() {
  return createDatabaseConnection();
}