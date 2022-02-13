import 'package:dio/dio.dart';
import 'package:my_books_to_read/models/book_model.dart';
import 'package:retrofit/retrofit.dart';

// class BooksRemoteDataSource {
//   Future<Map<String, dynamic>> getBooksData({
//     required String bookName,
//   }) async {
//     final response = await Dio().get<Map<String, dynamic>>(
//         'http://openlibrary.org/search.json?q=$bookName');
//     return response.data!;
//   }
// }

part 'books_remote_data_source.g.dart';

@RestApi(baseUrl: "http://openlibrary.org")
abstract class BooksRemoteRetrofitDataSource {
  factory BooksRemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
      _BooksRemoteRetrofitDataSource;

  @GET("/search.json?q={bookName}")
  Future<List<BookModel>> getTasks(@Path('bookName') String bookName);
}

// class BooksRemoteDataSource {
//   Future<List<Map<String, dynamic>>?> getBooks({
//     required String bookName,
//   }) async {
//     try {
//       final response = await Dio()
//           .get<List<dynamic>>('http://openlibrary.org/search.json?q=$bookName');

//       final listDynamic = response.data;

//       if (listDynamic == null) {
//         return null;
//       }
//       final responseList =
//           listDynamic.map((item) => item as Map<String, dynamic>).toList();
//       return responseList;
//     } on DioError catch (error) {
//       throw Exception(
//           error.response?.data['error']['message'] ?? 'unknown erorr');
//     }
//   }
// }
