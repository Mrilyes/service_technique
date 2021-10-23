import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service_technique/services/auth.dart';

class Client extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); //to set up form validation
  final AuthService _auth = AuthService();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController pc = TextEditingController();
  TextEditingController desc = TextEditingController();
  CollectionReference reports =
      FirebaseFirestore.instance.collection("Reports");

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
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: ' Nom',
                ),
                // validator: validateText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  nom.text = value;
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: ' Prenon',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre prenon';
                  }
                  prenom.text = value;
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: ' Adresse E-mail',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre E-mail';
                  }
                  email.text = value;
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: ' Numero De Telephone',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre Telephone';
                  }
                  tel.text = value;
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: ' Type De Ton PC',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre type de PC';
                  }
                  pc.text = value;
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'description de votre problème',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer ton problème';
                  }
                  desc.text = value;
                  return null;
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () async {
            // Validate returns true if the form is valid, or false otherwise
            if (_formKey.currentState!.validate()) {
              // Saving the report inthe database
              await reports.add({
                'Nom': nom.text,
                'Prenom': prenom.text,
                'Email': email.text,
                'Tel': tel.text,
                'PC': pc.text,
                'Description': desc.text,
              });
              print("Form was submitted successfully.");
              //Shows a snackbar with a message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ajoutée au succée')),
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
