import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_technique/models/declaration.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference ClientCollection =
      FirebaseFirestore.instance.collection('declaration');

  // Future<void> updateUserData(String name, String prenon, String mail,
  //     String number, String type, String describ) async {
  //   Map<String, String> data = {
  //     'name': name,
  //     'prenon': prenon,8
  //     'mail': mail,
  //     'number': number,
  //     'type': type,
  //     'describ': describ,
  //   };
  //   return await ClientCollection.doc(uid).set(data);
  // }
  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await ClientCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  // List<declaration> _brewListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     //print(doc.data);
  //     return declaration(
  //         name: doc.get('name')?? '',
  //         strength: doc.get('strength') ?? 0,
  //         sugars: doc.get('sugars')?? '0');
  //   }).toList();
  // }

  // get declaration stream

  Stream<QuerySnapshot> get declaration {
    return ClientCollection.snapshots();
  }
}
