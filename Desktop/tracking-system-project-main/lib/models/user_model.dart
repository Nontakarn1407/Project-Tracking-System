import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
export './user_model.dart';

class UserModel {
  late final FirebaseAuth auth = FirebaseAuth.instance;
  late final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<UserCredential?> registerWithEmailPassword(
      email, password, phoneNumber, displayName) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await db.collection('users').doc(user.user?.uid).set({
        'email': email,
        'phoneNumber': phoneNumber,
        'displayName': displayName,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return user;
    } catch (e) {
      return null;
    }
  }

  Future<UserCredential?> singInWithEmailAndPassword(email, password) async {

    try {
       final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());
      return user;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Error signing in: $e');
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error: $e');
      }
      return null;
    }
  }
  

  void signOut() async {
    return await auth.signOut();
  }
}
