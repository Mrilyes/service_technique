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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.account_box,
              size: 40.0,
            ),
            title: Text(
              "test@test.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("le: 10/24/2021 - tel: 52185821"),
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
                    id: '5515315383',
                    nom: "Ilyes",
                    prenom: "Ghorbel",
                    email: "test@test.com",
                    pc: "Asus",
                    tel: "52185821",
                    desc: "description",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
