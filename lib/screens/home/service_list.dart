// this widget is going to be responsible on outputting the difference declarations on the page

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:service_technique/screens/home/formulaire/formulaire.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  final reports = [
    {
      "id": '5515315383',
      "nom": "Ilyes",
      "prenom": "Ghorbel",
      "email": "ilyesGh@gmail.com",
      "pc": "Asus",
      "tel": "52185821",
      "desc": "description",
    },
    {
      "id": '515834838',
      "nom": "Test",
      "prenom": "Testo",
      "email": "test@test.com",
      "pc": "HP",
      "tel": "81856846",
      "desc": "description",
    },
    {
      "id": '321554238',
      "nom": "Chabchoub",
      "prenom": "Firas",
      "email": "firaschabchoub@test.com",
      "pc": "HP",
      "tel": "52640818",
      "desc": "description",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: reports.length,
      itemBuilder: (_, i) {
        return ListTile(
          leading: Icon(
            Icons.account_box,
            size: 40.0,
          ),
          title: Text(
            reports[i]["email"].toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle:
              Text("le: 10/24/2021 - tel: " + reports[i]["tel"].toString()),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 24.0,
            ),
            onPressed: () {},
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Formulaire(
                  id: reports[i]["id"],
                  nom: reports[i]["nom"],
                  prenom: reports[i]["prenom"],
                  email: reports[i]["email"],
                  pc: reports[i]["pc"],
                  tel: reports[i]["tel"],
                  desc: reports[i]["desc"],
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
