import 'package:dio/dio.dart';

class AuthorRemoteDataSource {
  Future<Map<String, dynamic>> getAuthorData({
    required String author,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'https://openlibrary.org/search/authors.json?q=j%20k%20rowling');
    final responseData = response.data;
    if (responseData != null) {
      final name = responseData['docs'][0]['name'];

      print(name);
    }
    return (response.data!['docs'][0]['name']);
  }
}
