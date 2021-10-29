// ignore_for_file: prefer_const_constructors, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  ServiceList({Key? key}) : super(key: key);

  var listOfWidgets = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfWidgets.length,
      itemBuilder: (BuildContext context, int index) => StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Reports").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Pas De Rapports");
          } else {
            return ...listOfWidgets;
          }
        },
      ),
    );
  }
  getReports(AsyncSnapshot<QuerySnapshot> snapshot) {
    var report = snapshot.data!.docs
        .map((doc) => ListTile(
              leading: Icon(Icons.account_box),
              title: Text(doc["Email"]),
              subtitle: Text(doc["Tel"]),
              trailing: IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {},
              ),
            ))
        .toList();
        listOfWidgets.add(report);
  }
}
