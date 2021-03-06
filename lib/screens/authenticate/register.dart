import 'package:flutter/material.dart';
import 'package:service_technique/services/auth.dart';
import 'package:service_technique/shared/constants.dart';
import 'package:service_technique/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: const Text('Inscrivez-vous'),
              actions: [
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text("s'identifier"),
                  onPressed: () => widget
                      .toggleView(), // widget refers to class Register extends StatefulWidget
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      SizedBox(height: 30.0),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'password'),
                        obscureText: true,
                        validator: (val) =>
                            val!.length < 6 ? 'Enter a password 6+' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 50.0),
                      RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            'enregistrer',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            setState(() => loading = true);
                            if (_formKey.currentState!.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'Please supply a valid email';
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                )));
  }
}
