import 'package:flutter/material.dart';
import 'package:service_technique/models/MyUser.dart';
import 'package:service_technique/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:service_technique/services/auth.dart';

// we can supply the stream to the provider like the auth change stream so when the stream get new data the provider makes accessible to any widget tree
// whatever use the login or logout the firebase auth will change stream will send a null or a user object which it can access to the widget tree in particular in the wrapper

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      catchError: (User, MyUser) => null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
