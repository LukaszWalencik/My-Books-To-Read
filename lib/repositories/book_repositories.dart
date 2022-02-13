import 'package:my_books_to_read/app/data/remote_data_sources/books_remote_data_source.dart';
import 'package:my_books_to_read/models/book_model.dart';

class BooksRepository {
  BooksRepository(this.booksRemoteDataSource);
  final BooksRemoteRetrofitDataSource booksRemoteDataSource;

  Future<List<BookModel>> getBookModel({required String bookName}) async {
    final json = await booksRemoteDataSource.getTasks(bookName);
    // if (json == null) {
    //   return [];
    // }
    return json;
    // .map((item) => BookModel.fromJson(item)).toList();
  }
}
