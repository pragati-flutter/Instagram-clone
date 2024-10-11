import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String  username;
  final String  postId;
  final  datePublished;
  final String  photoUrl;
  final String profImage;
  final likes;

  const Post(
      {required this.description,
        required this.uid,
        required this.username,
        required this.postId,
        required this.datePublished,
        required this.photoUrl,
        required this.profImage,
        required this.likes,
      });

  Map<String,dynamic>ToJson()=>{
    "description":description,
    "uid":uid,
    "username":username,
    "postId":postId,
    "datePublished":datePublished,
    "photoUrl":photoUrl,
    "profImage":profImage,
     "likes":likes,
  };
  static Post fromSnap(DocumentSnapshot snap){

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

    return Post(
      description: snapShot['description'] ?? '',
      uid: snapShot['uid'] ?? '',
      username: snapShot['username'] ?? '',
      postId: snapShot['postId'] ?? '',

      datePublished: snapShot['datePublished'] ?? '',
      photoUrl: snapShot['photoUrl'] ?? '',
      profImage: snapShot['profImage'] ?? '',

      likes: snapShot['likes'] ?? '',

    );

  }

}



