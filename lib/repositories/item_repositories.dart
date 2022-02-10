import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_books_to_read/app/data/remote_data_sources/books_remote_data_source.dart';
import 'package:my_books_to_read/models/book_models.dart';
import 'package:my_books_to_read/models/item_models.dart';

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

// class BooksRepository {
//   BooksRepository(this._booksRemoteDataSource);

//   final BooksRemoteDataSource _booksRemoteDataSource;

//   Future<List<BooksModel>> getBooksModel({
//     required String bookName,
//   }) async {
//     final responseData =
//         await _booksRemoteDataSource.getBooksData(bookName: bookName);
//     if (responseData == null) {
//       return [];
//     }
//     return responseData.map((item) => BooksModel.fromJson(item)).toList();
//     // final name = responseData['docs' 'title'] as String;
//     // return BooksModel(bookName: name);
//   }
// }

