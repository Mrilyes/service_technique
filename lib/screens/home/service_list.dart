// this widget is going to be responsible on outputting the difference declarations on the page

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_technique/models/rapport.dart';
import 'package:service_technique/screens/home/formulaire/formulaire.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  List<Rapport>? rapports = [];

  @override
  void initState() {
    super.initState();
    CollectionReference collRef =
        FirebaseFirestore.instance.collection('Reports');
    collRef.doc('nzcEBZHUQVgLgvjD2Unh').snapshots().forEach(
      (dataSnapshot) {
        rapports!.clear();

        Rapport rapport = Rapport(
          dataSnapshot.get('Nom').toString(),
          dataSnapshot.get('Prenom').toString(),
          dataSnapshot.get('Email').toString(),
          dataSnapshot.get('Tel').toString(),
          dataSnapshot.get('PC').toString(),
          dataSnapshot.get('Description').toString(),
        );
        rapports!.add(rapport);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: rapports!.length,
      itemBuilder: (_, i) {
        return ListTile(
          leading: Icon(
            Icons.account_box,
            size: 40.0,
          ),
          title: Text(
            rapports![i].email.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle:
              Text("le: 10/24/2021 - tel: " + rapports![i].tel.toString()),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 24.0,
            ),
            onPressed: () {
              setState(() {
                rapports!.remove(rapports![i]);
              });
            },
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Formulaire(
                  id: "Rapport",
                  nom: rapports![i].nom,
                  prenom: rapports![i].prenom,
                  email: rapports![i].email,
                  pc: rapports![i].pc,
                  tel: rapports![i].tel,
                  desc: rapports![i].description,
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
