// ignore_for_file: prefer_const_constructors, dead_code

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  ServiceList({Key? key}) : super(key: key);

  var listOfWidgets = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Reports").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapshot.data!.docs.map((doc) {
            return ListTile(
              leading: Icon(Icons.account_box),
              title: Text(doc["Email"]),
              subtitle: Text(doc["Tel"]),
              onTap: () {},
            );
          }).toList(),
        );
      },
    );
  }
}
