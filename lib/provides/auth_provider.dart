import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  User? get user => _user;

  Future<void> signIn(GlobalKey<FormState> formKey,String email, String password) async {
    if(formKey.currentState!.validate()){
      try {
        final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        _user = userCredential.user;
        notifyListeners();
      } catch (e) {
        print("----------error while sign-in");
        throw e;
      }
    }

  }

  Future<void> signUp(GlobalKey<FormState> formKey,String name, String email, String password) async {
    if(formKey.currentState!.validate()){
      try {
        final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        _user = userCredential.user;
        await _firestore.collection('users').doc(_user!.uid).set({
          'name': name,
          'email': email,
        });
        notifyListeners();
      } catch (e) {
        print("----------error while sign-up");
        throw e;
      }
    }

  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}