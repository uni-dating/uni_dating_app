import 'package:firebase_database/firebase_database.dart';

class RemoteRealtimeRepository {
  Stream<DatabaseEvent> getData(String path) {
    return FirebaseDatabase(
      databaseURL:
          'https://uni-dating-14c8d-default-rtdb.europe-west1.firebasedatabase.app',
    ).ref(path).onValue;
  }

  DatabaseReference getRef(String path) {
    return  FirebaseDatabase(
      databaseURL:
      'https://uni-dating-14c8d-default-rtdb.europe-west1.firebasedatabase.app',
    ).ref('/$path');
  }

  Stream<DatabaseEvent> setData(String path, Map<String, dynamic> data) {
    return  FirebaseDatabase(
      databaseURL:
      'https://uni-dating-14c8d-default-rtdb.europe-west1.firebasedatabase.app',
    ).ref(path).onValue;
  }
}
