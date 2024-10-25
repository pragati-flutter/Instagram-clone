
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';


import '../model/user.dart'as model;


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Future<model.User> getUserDetail() async {
  try {
    User currentUser = _auth.currentUser!;
  // Fetch user data from Firestore
  DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();

  // Check if the document exists
  if (!snap.exists) {
  throw Exception("User document does not exist");
  }

  // Log the fetched data
  print(snap.data());

  return model.User.fromSnap(snap);
  } catch (e) {
  print("Error fetching user details: $e");
  throw e; // Re-throw the error after logging
  }
  }





  //signup user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List? file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty &&
          file != null) {
        var cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print("...firebase user creation response -> ${cred.user!.uid}");
        String photoUrl = await StorageMethods()
            .uploadImagetoStorage('profilePics', file, false);
        model.User user = model.User(
          username: username,
          email: email,
          photoUrl: photoUrl,
          uid: cred.user!.uid,
          bio : bio,
          fallowing : [],
          followers: [],
        );


        await _firestore.collection('users').doc(cred.user!.uid).set(user.ToJson());
        res = "success";
      } else {
        res = "Akhand loves you";
      }
    } on FirebaseAuthException catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Error occurred";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void>signedOut()async{
    await _auth.signOut();
  }
}
