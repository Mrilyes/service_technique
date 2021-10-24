import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_technique/models/declaration.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference ClientCollection =
      FirebaseFirestore.instance.collection('declaration');

  Future getReports() async {
    final CollectionReference ReportsRef =
        FirebaseFirestore.instance.collection('Reports');

    QuerySnapshot snapshot = await ReportsRef.get();

    var data = snapshot.docs.toList();
    return data;
  }

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await ClientCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  Stream<QuerySnapshot> get declaration {
    return ClientCollection.snapshots();
  }
}
