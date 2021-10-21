import 'package:flutter/material.dart';
import 'package:service_technique/services/auth.dart';
import 'package:service_technique/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  // text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('connecter au service ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('inscrire'),
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
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
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
                  child: const Text(
                    "s'identifier",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Could not sign in with those credentials';
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
        ),
      ),
    );
  }
}
