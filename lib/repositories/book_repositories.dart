import 'package:http/http.dart' as http;
import 'package:my_books_to_read/app/data/remote_data_sources/books_remote_data_source.dart';
import 'package:my_books_to_read/models/book_model.dart';

class BooksRepository {
  BooksRepository(this.booksRemoteDataSource);
  final BooksRemoteDataSource booksRemoteDataSource;

  Future<List<BookModel>> getBookModel({required String title}) async {
    final json = await booksRemoteDataSource.getBooks(bookName: title);
    if (json == null) {
      return [];
    }
    final allBooks = json.map((item) => BookModel.fromJson(item)).toList();

    return allBooks.where((element) => false).toList();
    // Future<List<BookModel>> getBooksModel({required String title}) async {
    //   final json = await booksRemoteDataSource.getBooks(bookName: title);
    //   if (json == null) {
    //     return [];
    //   }

    //   return json.map((item) => BookModel(title: title).fromJson(item)).toList();

    // final name = responseData as String;

    // _booksRemoteDataSource.getBooksData(bookName: name);

    // return BookModel(title: name);

    //   final url = Uri.parse('http://openlibrary.org/search.json?q=lord');
    //   final response = await http.post(url);
    //   final bookModel = BookModel.fromJson(response.body);
    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');
    //   print(response);
    //   return bookModel.toString();
    // }
  }
}
