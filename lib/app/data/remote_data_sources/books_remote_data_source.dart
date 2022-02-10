import 'package:dio/dio.dart';

class BooksRemoteDataSource {
  Future<List<Map<String, dynamic>>?> getBooksData({
    required String bookName,
  }) async {
    try {
      final response = await Dio().get<List<dynamic>>(
          'http://openlibrary.org/search.json?title=$bookName');
      final listDynamic = response.data;

      print(listDynamic);
      if (listDynamic == null) {
        return null;
      }
      return listDynamic.map((e) => e as Map<String, dynamic>).toList();
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unknown error');
    }
  }
}

// class BooksRemoteDataSource {
//   Future<Map<String, dynamic>> getBooksData({
//     required String bookName,
//   }) async {
//     final response = await Dio().get<Map<String, dynamic>>(
//         'http://openlibrary.org/search.json?q=$bookName');
//     return response.data!;
