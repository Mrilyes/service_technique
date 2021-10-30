// ignore_for_file: prefer_const_constructors, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service_technique/screens/home/formulaire/formulaire.dart';

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
              title: Text(
                doc["Email"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Tel: ${doc["Tel"]}"),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Formulaire(
                          id: doc.id,
                          nom: doc["Nom"],
                          prenom: doc["Prenom"],
                          email: doc["Email"],
                          tel: doc["Tel"],
                          pc: doc["PC"],
                          desc: doc["Description"],
                        )));
              },
            );
          }).toList(),
        );
      },
    );
  }
}
