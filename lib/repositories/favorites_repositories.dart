import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_books_to_read/models/favorites_model.dart';

@injectable
class ItemRepository {
  Stream<List<ItemModels>> getItemsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      null;
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('books')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ItemModels(
          id: doc.id,
          name: doc['name'],
          author: doc['author'],
        );
      }).toList();
    });
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
