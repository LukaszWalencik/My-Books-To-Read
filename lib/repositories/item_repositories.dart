import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_books_to_read/models/item_models.dart';

class ItemRepository {
  Stream<List<ItemModels>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('books')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ItemModels(
          id: doc['id'],
          name: doc['name'],
          author: doc['author'],
          age: doc['age'],
        );
      }).toList();
    });
  }

  Future<void> remove({required String id}) async {
    FirebaseFirestore.instance.collection('books').doc(id).delete();
  }
}
