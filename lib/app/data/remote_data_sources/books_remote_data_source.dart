import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_books_to_read/models/book_model.dart';
import 'package:retrofit/retrofit.dart';

part 'books_remote_data_source.g.dart';

@injectable
@RestApi(baseUrl: "http://openlibrary.org/")
abstract class BooksRemoteDataSource {
  @factoryMethod
  factory BooksRemoteDataSource(Dio dio) = _BooksRemoteDataSource;

  @GET("/search.json?q={bookName}")
  Future<BookModel?> getBooks(@Path('bookName') String bookName);
}
