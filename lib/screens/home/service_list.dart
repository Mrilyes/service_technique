// this widget is going to be responsible on outputting the difference declarations on the page

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    final declaration = Provider.of<QuerySnapshot?>(context);

    for (var doc in declaration!.docs) {
      print(doc.data());
    }
    return Container();
  }
}
