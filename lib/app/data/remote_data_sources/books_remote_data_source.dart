import 'package:dio/dio.dart';
import 'package:my_books_to_read/models/book_model.dart';

// class BooksRemoteDataSource {
//   Future<Map<String, dynamic>> getBooksData({
//     required String bookName,
//   }) async {
//     final response = await Dio().get<Map<String, dynamic>>(
//         'http://openlibrary.org/search.json?q=$bookName');
//     return response.data!;
//   }
// }
class BooksRemoteDataSource {
  Future<List<Map<String, dynamic>>?> getBooks({
    required String bookName,
  }) async {
    final response = await Dio()
        .get<List<dynamic>>('http://openlibrary.org/search.json?q=$bookName');

    final listDynamic = response.data;

    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
