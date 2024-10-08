import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final List followers;
  final List fallowing;
  final String photoUrl;

  const User(
      {required this.username,
      required this.email,
      required this.photoUrl,
      required this.uid,
      required this.bio,
      required this.fallowing,
      required this.followers,
      });

  Map<String,dynamic>ToJson()=>{
    "username":username,
    "email":email,
    "photoUrl":photoUrl,
    "uid":uid,
    "bio":bio,
    "fallowing":fallowing,
    "followers":followers,

};
  static User fromSnap(DocumentSnapshot snap){

    if(!snap.exists){
      throw Exception("Document does not exist");
    }

    var data = snap.data();
    if(data == null){
      throw Exception("No data found");
    }else{
      print("helloooooooooo girlllllllllll");
    }

var snapShot = snap.data() as Map<String , dynamic>;

    return User(
      username: snapShot['username'] ?? '',
      email: snapShot['email'] ?? '',
      photoUrl: snapShot['photoUrl'] ?? '',
      uid: snapShot['uid'] ?? '',
      bio: snapShot['bio'] ?? '',
      fallowing: snapShot['fallowing'] ?? [],
      followers: snapShot['followers'] ?? [],
    );

    }

  }



