import 'package:dio/dio.dart';

class BooksRemoteDataSource {
  Future<Map<String, dynamic>> getBooksData({
    required String bookName,
  }) async {
    final response = await Dio()
        .get<Map<String, dynamic>>('http://openlibrary.org/search.json?q=the');
    final responseData = response.data;
    if (responseData != null) {
      final title = responseData['docs'][0]['title'];

      print(title);
    }
    return (response.data!['docs'][0]['title']);
  }
}
// class BooksRemoteDataSource {
//   Future<List<Map<String, dynamic>>> getBooksData({
//     required String bookName,
//   }) async {
//     final response = await Dio()
//         .get<Map<String, dynamic>>('http://openlibrary.org/search.json?q=the');
   
//     print(response.data);
//     return (response.data!['docs'] as List<dynamic>)
//         .map((e) => e as Map<String, dynamic>)
//         .toList();
//   }
// }

// class BooksRemoteDataSource {
//   Future<List<Map<String, dynamic>>> getBooksData({
//     required String bookName,
//   }) async {
//     final response = await Dio()
//         .get<Map<String, dynamic>>('http://openlibrary.org/search.json?q=lord');
//     final responseData = response.data;
//     if (responseData != null) {
//       final name = responseData['docs'][0]['title'];

//       print(name);
//     }
//     return (response.data!['docs']['2']['title']);
//   }
// }
