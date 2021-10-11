import 'package:flutter/material.dart';
import 'package:service_technique/services/auth.dart';

class Client extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); //to set up form validation
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Espace Client'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('déconnecter'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' Nom',
                ),
                // validator: validateText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' Prenon',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre prenon';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' Adresse E-mail',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre E-mail';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' Numero De Telephone',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre Telephone';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' Type De Ton PC',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre type de PC';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' description de votre problème',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer ton problème';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise
            if (_formKey.currentState!.validate()) {
              print("Form was submitted successfully.");
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Données en cours')),
              );
            }
          },
        ),
      ),
    );
  }
}


// validateText is when the user click on the floatingActionButton without field all the request he will recieve an error in UI else he will recieve submitted succesfully after he field every request

// String? validateText(String formText) {
//   // The validator receives the text that the user has entered.

//   if (formText.isEmpty) {
//     return 'Field is required.';
//   }
//   return null;
// }
