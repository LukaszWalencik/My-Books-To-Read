import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDataSource {
  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> signUp(String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> singIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getItemsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      null;
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('books')
        .snapshots();
  }

  Future<void> remove({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      null;
    }
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('books')
        .doc(id)
        .delete();
  }

  Future<void> add(
    String name,
    String author,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Nie zalogowano');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('books')
        .add(
      {
        'name': name,
        'author': author,
      },
    );
  }
}
