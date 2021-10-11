import 'package:flutter/material.dart';
import 'package:service_technique/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_technique/screens/home/service_list.dart';

class Service extends StatelessWidget {
  const Service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StreamProvider<QuerySnapshot?>.value(
    //   initialData: null,
    //   value: DatabaseService().declaration,
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Espace Service'),
        backgroundColor: Colors.brown[400],
      ),
      // body: ServiceList(),
    );
  }
}
