import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

QueryExecutor createDatabaseConnection() {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: 'app_db',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      print('Missing features for drift web: ${result.missingFeatures}');
    }

    return result.resolvedExecutor;
  });
}
