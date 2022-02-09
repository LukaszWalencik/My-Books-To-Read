import 'package:dio/dio.dart';

class BooksRemoteDataSource {
  Future<Map<String, dynamic>> getBooksData({
    required String bookName,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'http://openlibrary.org/search.json?q=$bookName');
    return response.data!;
  }
}
