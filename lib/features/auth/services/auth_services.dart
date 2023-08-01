// ignore_for_file: use_build_context_synchronously

import 'package:comments_assessment_app/constants/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return _auth.currentUser;
  }

  Future<User?> createUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await storeUserDataInFirebase(context: context, name: name, email: email);
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return _auth.currentUser;
  }

  Future storeUserDataInFirebase(
      {required BuildContext context,
      required String name,
      required String email}) async {
    try {
      await _firestore.collection('users').add({
        'name': name,
        'email': email,
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
