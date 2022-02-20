import 'package:dio/dio.dart';
import 'package:my_books_to_read/models/book_model.dart';
import 'package:retrofit/retrofit.dart';

part 'books_remote_data_source.g.dart';

@RestApi(baseUrl: "http://openlibrary.org/")
abstract class BooksRemoteDataSource {
  factory BooksRemoteDataSource(Dio dio, {String baseUrl}) =
      _BooksRemoteDataSource;

  @GET("/search.json?q={bookName}")
  Future<BookModel?> getBooks(@Path('bookName') String bookName);
}
// class BooksRemoteDataSource {
//   Future<Map<String, dynamic>?> getBooks({
//     required String bookName,
//   }) async {
//     final response = await Dio().get<Map<String, dynamic>>(
//         'http://openlibrary.org/search.json?q=$bookName');
//     return response.data;
//   }
// }

// part 'books_remote_data_source.g.dart';

// @RestApi(baseUrl: "http://openlibrary.org")
// abstract class BooksRemoteRetrofitDataSource {
//   factory BooksRemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
//       _BooksRemoteRetrofitDataSource;

//   @GET("/search.json?q={bookName}")
//   Future<List<BookModel>> getTasks(@Path('bookName') String bookName);
// }

// import 'package:dio/dio.dart';

// class BooksRemoteDataSource {
//   Future<List<Map<String, dynamic>>> getBooks({
//     required String bookName,
//   }) async {
//     try {
//       final response = await Dio().get<List<dynamic>>(
//           'http://openlibrary.org/search.json?q=the+lord+of+the+rings');
//       print(response);
//       final listDynamic = response.data!;

//       // if (listDynamic == null) {
//       //   return null;
//       // }
//       final responseList =
//           listDynamic.map((item) => item as Map<String, dynamic>).toList();
//       return responseList;
//     } on DioError catch (error) {
//       throw Exception(
//           error.response?.data['error']['message'] ?? 'unknown erorr');
//     }
//   }
// }

// import 'package:http/http.dart' as http;
// import 'package:my_books_to_read/models/book_model.dart';

// class BooksRemoteDataSource {
//   Future<String> getBooks({
//     required String bookName,
//   }) async {
//     var url =
//         Uri.parse('http://openlibrary.org/search.json?q=the+lord+of+the+rings');
//     final json = await http.get(url);
//     final responseList = json;
//     final docModel = Doc.fromJson(json);
//     print('Response status: ${json.statusCode}');
//     print('Response body: ${json.body}');
//     print(responseList.toString());
//     // .map((item) => item as Map<String, dynamic>).toList();
//     return docModel.toString();
//   }
// }
