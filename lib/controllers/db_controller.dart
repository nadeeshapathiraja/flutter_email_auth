import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
  //FireStore Instance Create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Create a Cloolection Reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

//Save User Data
  Future<void> saveUserInformation(String name, String email, String phone) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': name,
          'email': email,
          'phone': phone,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
