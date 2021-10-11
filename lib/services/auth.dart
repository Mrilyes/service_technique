import 'package:firebase_auth/firebase_auth.dart';
import 'package:service_technique/models/MyUser.dart';
import 'package:service_technique/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // the variable "_auth" is private which means it can only used in this file and not in another file
  // this property is to get us in firebase auth instance and that's is going to give the access to all different methods and properties on this class
  // whenever we want to something interact  with firebase auth in the future use the variable _auth directly

  // create MyUser object based on User
  MyUser? _userfromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  } // we created MyUser so we can show only the uid from the firebase

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map((User? user) => _userfromFirebase(
        user!)); // mapping into our user that in the app when we listen to the stream that user object is what we get back so grab the user object and do something with it
  } // stream is to listen for the authentication change when we get the user then show the client screen when the user sign in   even for the future when the user signout can also listen for that auth change then can show him the sign in screen again

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // create a new document for the user with the uid

      await DatabaseService(uid: user?.uid);
      return _userfromFirebase(user!);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
