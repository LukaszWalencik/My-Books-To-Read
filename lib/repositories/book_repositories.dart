import 'package:my_books_to_read/app/data/remote_data_sources/books_remote_data_source.dart';
import 'package:my_books_to_read/models/book_model.dart';

class BooksRepository {
  BooksRepository(this.booksRemoteDataSource);
  final BooksRemoteDataSource booksRemoteDataSource;

  Future<String> getBookModel({required String bookName}) async {
    final json = await booksRemoteDataSource.getBooks(bookName: bookName);

    return json;
    // .map((item) => BookModel.fromJson(item)).toList();
  }
}
