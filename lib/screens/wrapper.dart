import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_technique/screens/authenticate/authenticate.dart';
import 'package:service_technique/screens/home/client_screen.dart';
import 'package:service_technique/models/MyUser.dart';
import 'package:service_technique/screens/home/service_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    final User? cred = FirebaseAuth.instance.currentUser;

    // return Authenticate(); // return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      if (cred!.email == "cisencisen@gmail.com") {
        print(user.uid);
        return Service();
      } else {
        print(user.uid);
        return Client();
      }
    }
  }
}
